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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-2/simCANCoder-24.0.0-beta-2-headers.zip",
        sha256 = "c8425871e9c33b3344b5c0ef03260a1f95899ae07bdc0b1fd3d23c2e874de4fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-2/simCANCoder-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "7232190efbb2de40582449f71f3e0e5d209a61d18327af6e5b5e9284c00d59d9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-2/simCANCoder-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "ea79d0ca7e4cb46c3afe6d96763a6f23643d7d3967a206f3406381c7d6d8798b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-2/simCANCoder-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "8672e592fbb21b078a35cedecb6a2b16fbc2634dfc031b336f9368808f78640e",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-2/simPigeonIMU-24.0.0-beta-2-headers.zip",
        sha256 = "c8425871e9c33b3344b5c0ef03260a1f95899ae07bdc0b1fd3d23c2e874de4fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-2/simPigeonIMU-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "b7b1e92699f26f82e35d9006c2e03513507fdfbdb918db3c170655cd4e931685",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-2/simPigeonIMU-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "9ec971f22af38fd0ee4f442818b628278a43847a0c4e658b55055cccd7f9c7a6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-2/simPigeonIMU-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "80149024b7f15e8731492df0c05b10f8f6e1527ed6075ac08597bd827ea868a5",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-2/simProCANcoder-24.0.0-beta-2-headers.zip",
        sha256 = "c8425871e9c33b3344b5c0ef03260a1f95899ae07bdc0b1fd3d23c2e874de4fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-2/simProCANcoder-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "ba1f1ba6535eaa748b731558563ce595f8888c7217997f831644ec7504f60cf1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-2/simProCANcoder-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "7ebedfcd2f2d22b02b351aa4133c5ca8c3f46404ee06548e00326cdc0bb898a7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-2/simProCANcoder-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "635b80d542df0ed8796d8b67dcdfdbe68fd588e4a4e3815fa1c6df2026346088",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-2/simProPigeon2-24.0.0-beta-2-headers.zip",
        sha256 = "c8425871e9c33b3344b5c0ef03260a1f95899ae07bdc0b1fd3d23c2e874de4fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-2/simProPigeon2-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "8e11d4ed889e2a8165cc2727b946283e6d9cd08581a334e9ec53e0ca3e016771",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-2/simProPigeon2-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "449c9c361632f508b6a9d8252b028810e313eb53fa2a1492b9603e8dca467e68",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-2/simProPigeon2-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "d36bf11dc1a90f9b7423e70e392817c3efcef0047dc87b58fa8cc67c2b664454",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-2/simProTalonFX-24.0.0-beta-2-headers.zip",
        sha256 = "c8425871e9c33b3344b5c0ef03260a1f95899ae07bdc0b1fd3d23c2e874de4fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-2/simProTalonFX-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "c397d50bc232c6c92c5561cfee340f4d7316e72cb276b0188b23f25c48576286",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-2/simProTalonFX-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "39961837076a60956bba395954bdaf1a660c27f74afbbf42b14b270b66dee9c7",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-2/simProTalonFX-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "928f88fd4f978e5012e6ad1e2825a4806732bbeb6c90456daa3e226505c308a2",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-2/simTalonFX-24.0.0-beta-2-headers.zip",
        sha256 = "c8425871e9c33b3344b5c0ef03260a1f95899ae07bdc0b1fd3d23c2e874de4fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-2/simTalonFX-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "ea4c2c395e4db813b57dbd15e7727710c083d642761caf8fa81248bdd48e0dd4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-2/simTalonFX-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "3c6cffc7db3c89c745225a595cf5851171aaddf0719036b0b709539e6bf92032",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-2/simTalonFX-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "58161ecf71cee264d304122d98d54096ff0790da012bf9a17b0e19159cd7d1ab",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_SimTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-2/simTalonSRX-24.0.0-beta-2-headers.zip",
        sha256 = "c8425871e9c33b3344b5c0ef03260a1f95899ae07bdc0b1fd3d23c2e874de4fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-2/simTalonSRX-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "94b6fbe3595b4e2d44f43d44246cf0665fc9c9d27730dcf3167797b0ca68b60e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-2/simTalonSRX-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "95c4ef9696918b6319b220867dd7c028ed25b6d352b60fd4231bde3859122493",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-2/simTalonSRX-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "121604246eaa2bff04899e7534ed94a708dc99dc9f8eeb1e96f02b646707fb8c",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-2/simVictorSPX-24.0.0-beta-2-headers.zip",
        sha256 = "c8425871e9c33b3344b5c0ef03260a1f95899ae07bdc0b1fd3d23c2e874de4fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-2/simVictorSPX-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "ef733e8f3bb1c69264f4c6deb789640e461ecbab929bd1796ee8ced1fdeeec37",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-2/simVictorSPX-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "6118f4c4967a7c1802b8f6e437739b448c8ae7628e3b59692d42fe3f1cd8caab",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-2/simVictorSPX-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "767bc5e8c53899717010bee6a5ac4639c672b93cac1110269534b1e41a504e62",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-2/tools-24.0.0-beta-2-headers.zip",
        sha256 = "7aa2837f7d410265e7109f6eb08ec0d05727a660cc6969fcf416657172313f3f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-2/tools-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "1403e05c1ab6faa0369da88087fb201664bea99dfa461248d151e3ce8a6d3179",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-2/tools-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "b94a1658c1edce25baa00a767f13905ffccada5d855a0e8d508eabb409fe616d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-2/tools-24.0.0-beta-2-linuxathena.zip",
        sha256 = "74ee4131d1cd48ca65f0bf33e51310b35f29407e43946cc4f49eb36971192cd1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-2/tools-sim-24.0.0-beta-2-headers.zip",
        sha256 = "7aa2837f7d410265e7109f6eb08ec0d05727a660cc6969fcf416657172313f3f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-2/tools-sim-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "a0f5af5530cab695575dca7d850d8692f1cdc77803af6e545008c5fdefc54698",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-2/tools-sim-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "3801e3645ecbb322314a397aa56b25cf8ed3b648e39c714b263595c2648ed530",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-2/tools-sim-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "2205e1db10a00d6a0367d5aa10e97556f711ee59a3bc969dd98e9b5758ea0bdd",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-2/wpiapi-cpp-24.0.0-beta-2-headers.zip",
        sha256 = "d6c943a4f1a589fed72ea6c125c9598cb4a85afec1e2bf9d8d49e1c85504a7b6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-2/wpiapi-cpp-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "8dac849fabc32f119bae6ed4b1b074a4c29df89378536cfc88282e63e46da97c",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-2/wpiapi-cpp-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "9134e643665d13d91b16bf6d0d3d121f2ceff5b28b1eaf7bbab88319361e3986",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-2/wpiapi-cpp-24.0.0-beta-2-linuxathena.zip",
        sha256 = "adf0f6750090fe09299ffd472f03e126601edb82cc6957657cda7ed4fbac363f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-2/wpiapi-cpp-sim-24.0.0-beta-2-headers.zip",
        sha256 = "d6c943a4f1a589fed72ea6c125c9598cb4a85afec1e2bf9d8d49e1c85504a7b6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-2/wpiapi-cpp-sim-24.0.0-beta-2-windowsx86-64.zip",
        sha256 = "558336bba1513660dc98414325f14265dcb71a1f2e05ed067a97ca8f86583419",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-2/wpiapi-cpp-sim-24.0.0-beta-2-linuxx86-64.zip",
        sha256 = "bfbb4c54c167d9c8f863a74fe2786d21a640c6ac3b529178a30f395823c393ac",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-2/wpiapi-cpp-sim-24.0.0-beta-2-osxuniversal.zip",
        sha256 = "1a2f4cb99ef6d5baf1256efc886d2832308be706152507dd7411b40b89420141",
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
