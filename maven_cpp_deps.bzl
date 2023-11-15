load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_phoenix6_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-1/simCANCoder-24.0.0-beta-1-headers.zip",
        sha256 = "f7c625573c54c0a2fa8a377acee14fbefb42851f041ccd68c357a99896b069bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-1/simCANCoder-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "90089d7495ee50455250b619a3f7a4aca2ab940f4d420d596f59554d365e36eb",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-1/simCANCoder-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "5a6bd7f1c4200897e6e84fcce28538f7c9602d277e608fd83048daefb7ad42ce",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-1/simCANCoder-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "de4d2248ca5a735c1b85ac89822d50743c30c3d0d3429ae705ce7cd95db85b5d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-1/simPigeonIMU-24.0.0-beta-1-headers.zip",
        sha256 = "f7c625573c54c0a2fa8a377acee14fbefb42851f041ccd68c357a99896b069bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-1/simPigeonIMU-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "a221504df4258203f11745bf5a76a3085de8bb1f78fff4a6902236ae74bea943",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-1/simPigeonIMU-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "1b26d6777b5cf5dabacf5551ee00b4e0b1de3d0f2731abf39fcf3815e7918b68",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-1/simPigeonIMU-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "4a6dbce9fa5581f1336dc90fb33fb502dff570a798a99433e7a4690a275c4151",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-1/simProCANcoder-24.0.0-beta-1-headers.zip",
        sha256 = "f7c625573c54c0a2fa8a377acee14fbefb42851f041ccd68c357a99896b069bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-1/simProCANcoder-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "619d09f6dd1d9c9631c43aef17cc830f7d8e909984c5ba76f1b8d226190883e4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-1/simProCANcoder-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "7d2dcaeb5d02ee7a22a4dc2ce3dbda35998a04c5aefc2c1c9a943372db33e2b9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-1/simProCANcoder-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "4a6f918807771f5aabe8da2398773a57e984133b94cf4df3097127a87e4d0623",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-1/simProPigeon2-24.0.0-beta-1-headers.zip",
        sha256 = "f7c625573c54c0a2fa8a377acee14fbefb42851f041ccd68c357a99896b069bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-1/simProPigeon2-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "f894cc863332995aee94dd3c76a6b11f93a59466479625532d586c482a74aa3e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-1/simProPigeon2-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "9c4e7683d1b7fcaa96042a9b536fe823d7a424609b5707883af6ca77ee04dc50",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-1/simProPigeon2-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "2afc41306f66255708cd9642422d46d2b9df6af642d0a75626ff647b7c0efc7f",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-1/simProTalonFX-24.0.0-beta-1-headers.zip",
        sha256 = "f7c625573c54c0a2fa8a377acee14fbefb42851f041ccd68c357a99896b069bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-1/simProTalonFX-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "abcdaed8cc1bdd6e06e48ed923d23d366ae5bcf47649bad45b50792ca297e8e3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-1/simProTalonFX-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "74ca15110d8065184c4749478bcda28dc20eda3271ee327b54e6f02c2ae36c1d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-1/simProTalonFX-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "2d10c434f17762337cca456e4a9245104d92b4cc02f5eb163bcb5b3ebee0ee7c",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-1/simTalonFX-24.0.0-beta-1-headers.zip",
        sha256 = "f7c625573c54c0a2fa8a377acee14fbefb42851f041ccd68c357a99896b069bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-1/simTalonFX-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "6826ba84db21178772bc9c3219d0c8b624b02b65f08dee66030b222a0c388f84",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-1/simTalonFX-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "96cf1410404c70a889a5d4a21056347cfb0a5d3e41ce393740f37fa5283bfae0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-1/simTalonFX-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "c4e749339c31663d0d4a6e60bd0f55865abd0012bfb10552b2738821046e1240",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_SimTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-1/simTalonSRX-24.0.0-beta-1-headers.zip",
        sha256 = "f7c625573c54c0a2fa8a377acee14fbefb42851f041ccd68c357a99896b069bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-1/simTalonSRX-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "c135a652277933076f5f5a1f140cb98347f11301609c0d92d9136418ec724355",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-1/simTalonSRX-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "d160f33571bbb36745074c9865049c448aa0e3e3352bb8eb410477895f6ab3e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-1/simTalonSRX-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "db481f92969129b8d804db0b6330dc9e70114b84a0b360e5404ff1eefca945df",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-1/simVictorSPX-24.0.0-beta-1-headers.zip",
        sha256 = "f7c625573c54c0a2fa8a377acee14fbefb42851f041ccd68c357a99896b069bf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-1/simVictorSPX-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "3deb1ab67989df5f58b0579120e8e73c7de27a909fd260086e99c9dfe90553e0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-1/simVictorSPX-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "faff778e341ce700fb4e5760861c638bbd8034fd612691d3686a77057e026c81",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-1/simVictorSPX-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "0b4331add99ea76165d6d7f2e6855497e82bb8181f818ee256f358d61f49963b",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-1/tools-24.0.0-beta-1-headers.zip",
        sha256 = "ed0081b37573dbba5a5262bd65ac2a267da2c700af711b6bb1dffce64897430e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-1/tools-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "257b42e0151b6c979bec37afa1364230be0a29aaaf80c7cf69210f082f5bb915",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-1/tools-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "2b548c32672db5f865123d34dc094638ec59ac59d32c7c1002c1e63aa3352258",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-1/tools-24.0.0-beta-1-linuxathena.zip",
        sha256 = "09d92c403a6e11d70f0efac3624a7bf4dd995fa63bce9e098a1c332226478564",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-1/tools-sim-24.0.0-beta-1-headers.zip",
        sha256 = "ed0081b37573dbba5a5262bd65ac2a267da2c700af711b6bb1dffce64897430e",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-1/tools-sim-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "7a8729ff29f60bc20de441176fdf076a977262f0aa377ded1e34ffa918b98364",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-1/tools-sim-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "25ba651d22c5de04e8c7f2f980e1b8049eae12f45c6f877062a8befb3e3bfb6e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-1/tools-sim-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "7b36a2f1ce2a2ed3024d2a14a32792d44a95e8956bdc26d6807991c100965c2c",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimTalonFX.dylib @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-1/wpiapi-cpp-24.0.0-beta-1-headers.zip",
        sha256 = "616de73e203c37d2025f0d0941930906059f933c91a508f889f858094f783c96",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-1/wpiapi-cpp-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "43080d5edd0d608d88e718fa0faaa792c4ca395a7040a1f96dd11139ecacfd3b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-1/wpiapi-cpp-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "560cd6dc6852097aa6624c6cddd0f6583f4ee31faaf592237c3cc91f718840c0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-1/wpiapi-cpp-24.0.0-beta-1-linuxathena.zip",
        sha256 = "285085dcc8c98ed29e288da002fcd9a07310b0dc7c586e8351cff3a59a4c8d7a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-1/wpiapi-cpp-sim-24.0.0-beta-1-headers.zip",
        sha256 = "616de73e203c37d2025f0d0941930906059f933c91a508f889f858094f783c96",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-1/wpiapi-cpp-sim-24.0.0-beta-1-windowsx86-64.zip",
        sha256 = "abe7ed27f868f2edd8f3d2f350a5fd85be41408f90814bce393700aa056ac508",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-1/wpiapi-cpp-sim-24.0.0-beta-1-linuxx86-64.zip",
        sha256 = "acc9090bb29f89c63d09e105964be267b64f545de9e695685f2a5e5256411ac5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-1/wpiapi-cpp-sim-24.0.0-beta-1-osxuniversal.zip",
        sha256 = "9af61d48c7061e678432a388ee94273f169a737e8736046c1fa72ff9c6500e25",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_Phoenix6_WPISim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimTalonFX.dylib @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libcameraserver.dylib @rpath/libcameraserver.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libcscore.dylib @rpath/libcscore.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libwpiHal.dylib @rpath/libwpiHal.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libwpilibc.dylib @rpath/libwpilibc.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libwpimath.dylib @rpath/libwpimath.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libwpinet.dylib @rpath/libwpinet.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libwpiutil.dylib @rpath/libwpiutil.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
        ],
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
