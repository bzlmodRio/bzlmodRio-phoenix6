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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-8/simCANCoder-24.0.0-beta-8-headers.zip",
        sha256 = "53ffbd10674d0e1e48d935b951e37adc5701bc239c2570679fe05facded62af3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-8/simCANCoder-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "ef131fd3d7825d0562afdc078d5ec223f01855e54f556a491ee623530ab28198",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-8/simCANCoder-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "2e7135af113f02c76202402fe092fd27645aab6f6bdb327b015d71970af8d817",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-8/simCANCoder-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "f8f26a9d9a25533df078d28c152de723b9e9ecb0ab70c29f0ebb549381160655",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-8/simPigeonIMU-24.0.0-beta-8-headers.zip",
        sha256 = "53ffbd10674d0e1e48d935b951e37adc5701bc239c2570679fe05facded62af3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-8/simPigeonIMU-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "4cc2261afab79874e715b75784bc0cf7c1e21c66385da687a92bb5b47400e30f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-8/simPigeonIMU-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "76d434a60a76665bd0464eebc90b2f42b7c27e3dd65fb2ac67166dd9af9f90a4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-8/simPigeonIMU-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "bb19374f92bf85a97aa266372e745a14909f5040cca9a849727e47e107b0255d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-8/simProCANcoder-24.0.0-beta-8-headers.zip",
        sha256 = "53ffbd10674d0e1e48d935b951e37adc5701bc239c2570679fe05facded62af3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-8/simProCANcoder-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "5b8b0d69f68ccfd71234ef214b6434b5c8cbaab7750b1a39f38c4248e0f95dd3",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-8/simProCANcoder-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "0aa3401cdf5a1d7825c316da928da60c0862489bf695e4d50d6a8ece401a4029",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-8/simProCANcoder-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "110a8240456dae534f8401030304b98e6ecf7102141f89771bec2a6026d4d9c3",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-8/simProPigeon2-24.0.0-beta-8-headers.zip",
        sha256 = "53ffbd10674d0e1e48d935b951e37adc5701bc239c2570679fe05facded62af3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-8/simProPigeon2-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "3275866dd1a2fefdf5c97cdd8a21f9dc0e52f7743cdb86c89f72dc8f5a3db47c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-8/simProPigeon2-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "bdabff3e9b3f16df9994d00d4d205b86335676570751cb08ff1297885fe14041",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-8/simProPigeon2-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "2409c7d422120b11b3a884786b98ef86fae287674ebc795d54dbfd39fa19ab46",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-8/simProTalonFX-24.0.0-beta-8-headers.zip",
        sha256 = "53ffbd10674d0e1e48d935b951e37adc5701bc239c2570679fe05facded62af3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-8/simProTalonFX-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "7acdfff6e3d6a8ba703f67f00b22182a76f8b8cff3aa0eb284f706e875cd3f8e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-8/simProTalonFX-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "cc95a6c5c8bac472a2ea1a8059705864cf8fd2a5da69b75b50782fbf6fddd204",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-8/simProTalonFX-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "7a2f45c5fc97bd8486ccbb5936a8791ca4a93c3567ed788a1ed2bccac08aae1d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-8/simTalonFX-24.0.0-beta-8-headers.zip",
        sha256 = "53ffbd10674d0e1e48d935b951e37adc5701bc239c2570679fe05facded62af3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-8/simTalonFX-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "474af682be07cf13360dfad72fa67f298aca3f5d3bc43b9de85fcc9767907e5d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-8/simTalonFX-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "679da8f38b36d426b9dd12dd70bf11c8cd262bec98cf8023b7d0e123e7fb6fb4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-8/simTalonFX-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "a6c4ff1a224e1792026186785bd7e7e87d3358d1f9e894239fe49d07447a72e6",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_SimTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-8/simTalonSRX-24.0.0-beta-8-headers.zip",
        sha256 = "53ffbd10674d0e1e48d935b951e37adc5701bc239c2570679fe05facded62af3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-8/simTalonSRX-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "9b1075df77b1818e0f0d3a4061f04e603e42518d8710f471cb7c5432752afddd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-8/simTalonSRX-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "6cac29451732e52de01af884289ae671c3cb490a4dc3336b99a88fd39ddd35a8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-8/simTalonSRX-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "7bc66f95a7a39fe03c028690ba2c81153ead64d0f3085fbe59479a15a348d428",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-8/simVictorSPX-24.0.0-beta-8-headers.zip",
        sha256 = "53ffbd10674d0e1e48d935b951e37adc5701bc239c2570679fe05facded62af3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-8/simVictorSPX-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "f197ac45f379751c0e5dfb0ec816a5a5165c9ac3a606bd3ac36dc2ba0e610367",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-8/simVictorSPX-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "f6ffc123650edbd4c1bc9984531d215e4fdb8fc1e7f5e1ec866b461e0f1dc17b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-8/simVictorSPX-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "edccf2b344dacc87a95a7314bf5c8c88be6aeef106a746f2b351ebad04343837",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-8/tools-24.0.0-beta-8-headers.zip",
        sha256 = "8d4f732ae7ae8b20d702ee168996d820a03d836d3a57359651f93a4a4ffc3a96",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-8/tools-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "164cbef03b63be825d427407ef8e5e4696289bd7f776da4fc1bec2f1faad6bbd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-8/tools-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "0a8966ea44d18a6708c40f7d4fd550fd377a60119b8f0b5d19e2f27ca84f6e6e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-8/tools-24.0.0-beta-8-linuxathena.zip",
        sha256 = "0d5f443c7aeb592f24cab8e1dcbb5c3d8ccfc3fef4705b52a1a6390fbec5aa4b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-8/tools-sim-24.0.0-beta-8-headers.zip",
        sha256 = "8d4f732ae7ae8b20d702ee168996d820a03d836d3a57359651f93a4a4ffc3a96",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-8/tools-sim-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "aa3eff58f9c7e835433d1610bc386ef9246817499f42a7acfafa241f897ce1fc",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-8/tools-sim-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "0e16e7d2995a5471ca92e1e0b4c2365253309912940b6b426ed789379faa6a4a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-8/tools-sim-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "9fd51e4e63ec1a317951c12e8355ebef409cb3c3a70b3a3a463b780384f77c5c",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-8/wpiapi-cpp-24.0.0-beta-8-headers.zip",
        sha256 = "3dc028374d39fed728f3626b5705e238d16bf62ee64272e1d173084091c8206b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-8/wpiapi-cpp-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "dbce9982614f6065ebf37880abffb1e07d9b2c9bf4d68435680b1d71f8bbf840",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-8/wpiapi-cpp-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "58bf9a2cf32cc7a1b3845fe41be225f2b965a99b543948d4a410f5b8762c47b2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-8/wpiapi-cpp-24.0.0-beta-8-linuxathena.zip",
        sha256 = "43ae15dae0537884c7692bba98423b3b6ed4e5cb703aa56d1a9c85c6c7ac42a4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-8/wpiapi-cpp-sim-24.0.0-beta-8-headers.zip",
        sha256 = "3dc028374d39fed728f3626b5705e238d16bf62ee64272e1d173084091c8206b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-8/wpiapi-cpp-sim-24.0.0-beta-8-windowsx86-64.zip",
        sha256 = "6beae6851f60adf46fe246d9bcd76ce521a4612b5a406f16031cc274d8e70ee4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-8/wpiapi-cpp-sim-24.0.0-beta-8-linuxx86-64.zip",
        sha256 = "302023d2275138f5cc2df3e5bb49cc287b407ac66fee9700939f16b0aac62de8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-8/wpiapi-cpp-sim-24.0.0-beta-8-osxuniversal.zip",
        sha256 = "4fcd5189f27796d7a57098c19ee371e7323919a495c110c2c33afa7ade998722",
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
