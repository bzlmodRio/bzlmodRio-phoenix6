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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-7/simCANCoder-24.0.0-beta-7-headers.zip",
        sha256 = "776bff17777dbc1dece172e0beb0e269728f2b2b8fe5c636a35b3913e8bce993",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-7/simCANCoder-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "6ebf9a08e2124bc825005fd516e8d9f92ca914c54d13874858eeb4bb3a4b1243",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-7/simCANCoder-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "db11a471ac11255ab8586c07d3bf0e1d4e2a92824125309a59e588363cb06b3f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-7/simCANCoder-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "a0835e8cec591d4e5fede189603d7b4d511baade37f0a582b3f7fe00f4a46f7b",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-7/simPigeonIMU-24.0.0-beta-7-headers.zip",
        sha256 = "776bff17777dbc1dece172e0beb0e269728f2b2b8fe5c636a35b3913e8bce993",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-7/simPigeonIMU-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "bf7b7c0e1ac6442501ea6e99d52d0f4f74057ee238d368072cd3b40f65a7a096",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-7/simPigeonIMU-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "7860445aba39ff6a0210f2c1e8ec1e08b458728018dc0af803229b38a9d21db9",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-7/simPigeonIMU-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "8d8621d2c7cdd3ef191a8cfb2fa4ce686b0ed12962fe0e307b27599da2a2f959",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-7/simProCANcoder-24.0.0-beta-7-headers.zip",
        sha256 = "776bff17777dbc1dece172e0beb0e269728f2b2b8fe5c636a35b3913e8bce993",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-7/simProCANcoder-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "ea2e64ead3307d917a68c89fd2ce170d4ef81894ab27465deb73de73a72183ce",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-7/simProCANcoder-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "770ae2ef1568fe0466294e3fb01c3128ee5499ea2bf19027222b00614407799f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-7/simProCANcoder-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "864fbae842f92c8657c08c028f26994dc9d919851160e275fb75d3f70f7f6f49",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-7/simProPigeon2-24.0.0-beta-7-headers.zip",
        sha256 = "776bff17777dbc1dece172e0beb0e269728f2b2b8fe5c636a35b3913e8bce993",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-7/simProPigeon2-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "d3dbe0c6c2dc88fe19318ab9278335cd8220c87052e995eab1e7ab82ef87c990",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-7/simProPigeon2-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "4fd65baa37166b3f20aabade0c67f9f861d1cc03447329c686824bfc6222c6f0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-7/simProPigeon2-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "861548bc8d31d5e81142f5fa9c0381dde1fecd1ed992fb1bb23559b87adcb75b",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-7/simProTalonFX-24.0.0-beta-7-headers.zip",
        sha256 = "776bff17777dbc1dece172e0beb0e269728f2b2b8fe5c636a35b3913e8bce993",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-7/simProTalonFX-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "c5d2076e9e5946062c720aa3e0c47273e7fe42563d1b9a86f3c9fd686de9e45e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-7/simProTalonFX-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "9a94134acd1946f4e9949eb8b19fe73fcb8edffe285408b9b37118adbf602b09",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-7/simProTalonFX-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "68e6788820a16fd2e0e230ce6b03b515e7c7eee03ea61f70c2e2d922c78a6025",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-7/simTalonFX-24.0.0-beta-7-headers.zip",
        sha256 = "776bff17777dbc1dece172e0beb0e269728f2b2b8fe5c636a35b3913e8bce993",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-7/simTalonFX-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "16a2ab7c3c45030ca2671af065afc5612c5622f9900a7b16bacdb526218c4bde",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-7/simTalonFX-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "bc46d575834b7c6ab6461ec6a0fac0c75d6824a50145b883bc631f4cdc6bfca4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-7/simTalonFX-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "009bc3388341c4cd482aea0f26bce45eb8b6fbd72b14639339c5197c488c1db9",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_SimTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-7/simTalonSRX-24.0.0-beta-7-headers.zip",
        sha256 = "776bff17777dbc1dece172e0beb0e269728f2b2b8fe5c636a35b3913e8bce993",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-7/simTalonSRX-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "9b8a2c90c6cb42d2d1215ce7ca6f52059d6e32c94a3d84bf58f2af16521bce2b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-7/simTalonSRX-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "e610b091dbc4404f7bc8391e3860adb85fa69e01fca122523c4162ba8910e583",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-7/simTalonSRX-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "28938569f33878d35a4e64585910d51f2c5a9d4affb8b208fb9c687ca49b79a8",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-7/simVictorSPX-24.0.0-beta-7-headers.zip",
        sha256 = "776bff17777dbc1dece172e0beb0e269728f2b2b8fe5c636a35b3913e8bce993",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-7/simVictorSPX-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "8728f7ac85d81b95a7faa44e3694ae82ec8061b331e8f9f0cdc8e1c23102d25d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-7/simVictorSPX-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "57290629952f586b614ec44e38959ad10d194adcdcdfbc47026430bf4e716082",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-7/simVictorSPX-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "4a6446b3bb01bb86901637509c51c8485efbcf26ca6bce5d7432bd226ce253c9",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-7/tools-24.0.0-beta-7-headers.zip",
        sha256 = "a2d9f361b7547ef99ec4306c73e6199cae1815b66e283f68e6cbb91bcdd35727",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-7/tools-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "fcca81d36cbb20a2d226b2487c7c2503903f9496c7c2ce27aa1467224e1e0bd5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-7/tools-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "f070486a2ed7991db70f2f4952bb3310b563e423dfb08f1a25e83f82e7df14ae",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-7/tools-24.0.0-beta-7-linuxathena.zip",
        sha256 = "fe54d1883496270612529ba2d72c58fef8199491159b0d2caf5cf9fec33343c6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-7/tools-sim-24.0.0-beta-7-headers.zip",
        sha256 = "a2d9f361b7547ef99ec4306c73e6199cae1815b66e283f68e6cbb91bcdd35727",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-7/tools-sim-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "ad16a2bff176d12f2610f69efde227b628a772e977fc5f12ade6e5015dc5fd9f",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-7/tools-sim-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "80b54ccfd317645b79b7cb018f86a2e65d4629df827fcb5a90b8b68850023f14",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-7/tools-sim-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "f6c4ce81917bd8c115574d4fdb81f276a4a8cc58633ee417a779407fc575f1e0",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-7/wpiapi-cpp-24.0.0-beta-7-headers.zip",
        sha256 = "5be7475552d0e6e374d45160ac87c829c186bfac4dbc148c5147a0e8b610960b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-7/wpiapi-cpp-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "309b801c90375edb9db0bfe21c0639a3c2d678d7189c1c011112d4f046d92e13",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-7/wpiapi-cpp-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "ae7d7c7ade609b6373d4adfc41b1d536ca8608dc9a09446feee32313d19077ed",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-7/wpiapi-cpp-24.0.0-beta-7-linuxathena.zip",
        sha256 = "32bd24533fd17af912d7f611308a3f260198488ee3e8fd9b69033af309594833",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-7/wpiapi-cpp-sim-24.0.0-beta-7-headers.zip",
        sha256 = "5be7475552d0e6e374d45160ac87c829c186bfac4dbc148c5147a0e8b610960b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-7/wpiapi-cpp-sim-24.0.0-beta-7-windowsx86-64.zip",
        sha256 = "1fc5da8d4c40486a637daf922195002ee892f6d130b48d1d3fb06038279ead02",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-7/wpiapi-cpp-sim-24.0.0-beta-7-linuxx86-64.zip",
        sha256 = "1f3cfc54bddea57ea48189a97b1dfce76470489c8aa5fbfbc157450288eb8898",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-7/wpiapi-cpp-sim-24.0.0-beta-7-osxuniversal.zip",
        sha256 = "49aeeda991015a034af23e3c3699404d15e8dcc890c9e8c3c3327cf184927bc0",
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
