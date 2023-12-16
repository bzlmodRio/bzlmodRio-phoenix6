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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-5/simCANCoder-24.0.0-beta-5-headers.zip",
        sha256 = "53643ffdb68ca1d42391cffcb4b7da1b14f1aaadc498e86b6cfefad02f8cc666",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-5/simCANCoder-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "c3d2d79e0a43d6a645a0736bfc675c9121bfacf8230011323ca9ee74c35bdfb4",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-5/simCANCoder-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "7e329234a234bc91c079ffd1a7740da0704e6e8b676855f4538c3f1b5688e4e1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/24.0.0-beta-5/simCANCoder-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "fa79b79ba2403df4cf76b27d56b0aef37353e9a40fe987953e309789afc1416b",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-5/simPigeonIMU-24.0.0-beta-5-headers.zip",
        sha256 = "53643ffdb68ca1d42391cffcb4b7da1b14f1aaadc498e86b6cfefad02f8cc666",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-5/simPigeonIMU-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "57ed5e21c98672f963a57f5c2d0a5bbde5456f346ef0305da82d618e694d3b22",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-5/simPigeonIMU-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "4890e04c1297db5b2abb632a7f5828836b41dad22de5af8b1d844ee9d5198bec",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/24.0.0-beta-5/simPigeonIMU-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "3e8e36c62adfd68a5a9ddaa2d0ad718ec9148faea8c5eb669c366a51f7fd6d2d",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-5/simProCANcoder-24.0.0-beta-5-headers.zip",
        sha256 = "53643ffdb68ca1d42391cffcb4b7da1b14f1aaadc498e86b6cfefad02f8cc666",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-5/simProCANcoder-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "b9542a0da53560b6445634ce3f3ebff43e3e71213282ec1afb35bf42ac40b95d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-5/simProCANcoder-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "14a8a391ee1c851c1a1996ea5f550de55cbaaad0392f6323a92e9c167f9b2f0e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/24.0.0-beta-5/simProCANcoder-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "0de9eb8ecf967d3a5a4fe728456fb7c573910553e3e55975b2c795794a8cba85",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-5/simProPigeon2-24.0.0-beta-5-headers.zip",
        sha256 = "53643ffdb68ca1d42391cffcb4b7da1b14f1aaadc498e86b6cfefad02f8cc666",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-5/simProPigeon2-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "81fed110d15f1e2a040d5696c19b6bcd496ff5f7b54d153897a4bc3bf9f4cbfd",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-5/simProPigeon2-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "02508ecd7c312810eebbe3c6b09fcee509be70e847624cdc5e468afc374fae2d",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/24.0.0-beta-5/simProPigeon2-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "30a4cdd4c864232656ca6153fbe9502185dbee0e37aa36cac924f0e85272788f",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-5/simProTalonFX-24.0.0-beta-5-headers.zip",
        sha256 = "53643ffdb68ca1d42391cffcb4b7da1b14f1aaadc498e86b6cfefad02f8cc666",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-5/simProTalonFX-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "796fb3b30a01ec4d7aa25304a112556bdd5b961a232c71474809802d813bda4b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-5/simProTalonFX-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "339abce5e9383bda4fe2f0eabd69f7ff861e694c67ff7e6b010ba2c79b85a528",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/24.0.0-beta-5/simProTalonFX-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "accf56d24c74efc97724464d436787f4ef0e068ac72ed11967a36c642d3fab41",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-5/simTalonFX-24.0.0-beta-5-headers.zip",
        sha256 = "53643ffdb68ca1d42391cffcb4b7da1b14f1aaadc498e86b6cfefad02f8cc666",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-5/simTalonFX-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "783f995fce9b9fbacd202aa28bce3d806c25c769665a96be3d5dbe91f668a2e0",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-5/simTalonFX-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "9bf7de91144913d02e3c8200902d19069b1f981ace030c7bf010cf81c86e0831",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonFX/24.0.0-beta-5/simTalonFX-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "ccef1cc259f42729d07ad90fe81a67519c64c9886896b4f3d4f678b6be5269e4",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonFX.dylib osx/universal/shared/libCTRE_SimTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-5/simTalonSRX-24.0.0-beta-5-headers.zip",
        sha256 = "53643ffdb68ca1d42391cffcb4b7da1b14f1aaadc498e86b6cfefad02f8cc666",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-5/simTalonSRX-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "227416c9d790dcbbf0ec36ed0aa3dd443202a15b47e14d70f031445a78b726b5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-5/simTalonSRX-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "0d5e3a8d471de31acbdd11d10afe2fffeb803d204ab5cc043fde4dd2668a4264",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/24.0.0-beta-5/simTalonSRX-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "cca2fde5c17ade522a1b5298675cb61f5794d1622f690acf6043a33c6410828a",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-5/simVictorSPX-24.0.0-beta-5-headers.zip",
        sha256 = "53643ffdb68ca1d42391cffcb4b7da1b14f1aaadc498e86b6cfefad02f8cc666",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-5/simVictorSPX-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "d14cefa5286748a17cddcef04d4ee026bc080dbfb505729f60a012bf0a80f648",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-5/simVictorSPX-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "abb941f573618307c79a7fb519a240ddfe2a5be383897ad58d913db49e6dbd14",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/24.0.0-beta-5/simVictorSPX-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "1c2a615be31d23f7506a4b1ce3a390a8e97610e161370ce05c7fba732bc0ab20",
        build_file_content = cc_library_shared,
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-5/tools-24.0.0-beta-5-headers.zip",
        sha256 = "c5a9da5b4e3d3d886971a88b97d2bcb8dc41ba61dd9a7af65ab80b8c3eb3c296",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-5/tools-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "163d2c69121bdb5e89965978e286067159a4e6eb92d3f5da50321a9d2be2b809",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-5/tools-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "6614ff8f46d4a8f6eae5ddd05cb382cec98626fa43bc9bd589e9d70ce34686f6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/24.0.0-beta-5/tools-24.0.0-beta-5-linuxathena.zip",
        sha256 = "a119d3a1346e3427293237b9780f5063263e5b2803d682a919f6d37ae03837a1",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-5/tools-sim-24.0.0-beta-5-headers.zip",
        sha256 = "c5a9da5b4e3d3d886971a88b97d2bcb8dc41ba61dd9a7af65ab80b8c3eb3c296",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-5/tools-sim-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "65044e8abb76ebba300cb6fc4a10f6ca1eea3778bbb724776d2d00e9243b76a2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-5/tools-sim-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "7f89b4033c3de4d708016185d201b6eae9990a06d3c8747adcde75bc79fef8c2",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/24.0.0-beta-5/tools-sim-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "83d07cdf5ee9329c522449588fde0a27f29f1490accafefb1da3f14e39252af0",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-5/wpiapi-cpp-24.0.0-beta-5-headers.zip",
        sha256 = "87cfc7d994a8c9ac64a7610e5774b1572f5a562d1af6ff6f91167f963d91a787",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-5/wpiapi-cpp-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "eb352433e97c46f657cd6847fc06aff00cdd2e9d2e57b502d4fd5ee72d38aba6",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-5/wpiapi-cpp-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "f1fe50808933a1479092222defba21368223f7bd0193a27df47e7b01ee7a1b1b",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/24.0.0-beta-5/wpiapi-cpp-24.0.0-beta-5-linuxathena.zip",
        sha256 = "e603693e017e384b22ad5f6b4a33f0633efe4670c5ce870ddfc948b37210a88a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-5/wpiapi-cpp-sim-24.0.0-beta-5-headers.zip",
        sha256 = "87cfc7d994a8c9ac64a7610e5774b1572f5a562d1af6ff6f91167f963d91a787",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-5/wpiapi-cpp-sim-24.0.0-beta-5-windowsx86-64.zip",
        sha256 = "8cd30a212b6ed9974d90d683f6a0344a76d4e5f3a1b5c542beef3c25a0cac6d5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-5/wpiapi-cpp-sim-24.0.0-beta-5-linuxx86-64.zip",
        sha256 = "d320014f09fc40e85194968142583b20d27a60220ee0a4807bf9791297573a82",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/24.0.0-beta-5/wpiapi-cpp-sim-24.0.0-beta-5-osxuniversal.zip",
        sha256 = "df2514e2fce92dee64cd9087be3fc8263d2016b90a4cd856e7cce2c24e729686",
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
