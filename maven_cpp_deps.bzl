load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)

filegroup(
    name = "header_files",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_phoenix6_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.1/simCANCoder-25.2.1-headers.zip",
        sha256 = "fd2b98d22239ee2382db33fc805776c164ce736a5eb3c9ad543ce4bae7a7678d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.1/simCANCoder-25.2.1-windowsx86-64.zip",
        sha256 = "f0c0df79dc006b6e9ccee071d5faea6cf25c11e89c8b2db504ad91e3725b2593",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.1/simCANCoder-25.2.1-linuxx86-64.zip",
        sha256 = "5062b8e720d50e4355e614736c28275ee6dba9cd4947d85e1d1cb767fcfb0e68",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.1/simCANCoder-25.2.1-linuxarm64.zip",
        sha256 = "511bec94aba9572ae1d9dbb8048e25b110950a07fa67f9acfe031dc67a2e2557",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.1/simCANCoder-25.2.1-osxuniversal.zip",
        sha256 = "48ad652b25b9b1c3baced6fe622db1c85fb2e7ea511d113d0b4808ec5ca05511",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.1/simPigeonIMU-25.2.1-headers.zip",
        sha256 = "fd2b98d22239ee2382db33fc805776c164ce736a5eb3c9ad543ce4bae7a7678d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.1/simPigeonIMU-25.2.1-windowsx86-64.zip",
        sha256 = "674444e247f9ee435de39ce22ad362c3f1fd15433eed7750023865f0608cc5e5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.1/simPigeonIMU-25.2.1-linuxx86-64.zip",
        sha256 = "241176d28869e2e3ff0f8a8868652850668610957e5869bd11b77361dbc6481f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.1/simPigeonIMU-25.2.1-linuxarm64.zip",
        sha256 = "0cc6822dff7ee6ba470b9d269823b371d9823120bd768c2ff716a929a3f7c05b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.1/simPigeonIMU-25.2.1-osxuniversal.zip",
        sha256 = "c6cfca8f81db9862a96daadc9e403a3616f2f26f5aeb8e658580d2912577b216",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.1/simProCANcoder-25.2.1-headers.zip",
        sha256 = "fd2b98d22239ee2382db33fc805776c164ce736a5eb3c9ad543ce4bae7a7678d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.1/simProCANcoder-25.2.1-windowsx86-64.zip",
        sha256 = "bf57dd34e5ee2d4c10473efacb83f672270b7cb587659b67fec278cee701cb41",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.1/simProCANcoder-25.2.1-linuxx86-64.zip",
        sha256 = "1a563158d97aa6711073c1a44d09dc659ebad2ff8f341bbe28944b6e7101f7cf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.1/simProCANcoder-25.2.1-linuxarm64.zip",
        sha256 = "38f4394b824c2725c7ec4f528f0ad23d74987601c8820b9301f2eeb80b29457c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.1/simProCANcoder-25.2.1-osxuniversal.zip",
        sha256 = "4499967b332fac5f4ff27319e27ac8eafe274d568c096fcc0ca42be7c1030642",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.1/simProCANrange-25.2.1-headers.zip",
        sha256 = "fd2b98d22239ee2382db33fc805776c164ce736a5eb3c9ad543ce4bae7a7678d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.1/simProCANrange-25.2.1-windowsx86-64.zip",
        sha256 = "b624eb717ae32fe3dc8d081cd870bcb3c1e75a103de8b4c7eefdbfc4dcb0732e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.1/simProCANrange-25.2.1-linuxx86-64.zip",
        sha256 = "1976966991b161301e4e80cfad3697334c62ce3ac5906e0f9378cd4daf8e1be0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.1/simProCANrange-25.2.1-linuxarm64.zip",
        sha256 = "c37ead179689a21a5a27adb58d3b2aecbc322624d2d277f7272e4dbd0a9c4265",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.1/simProCANrange-25.2.1-osxuniversal.zip",
        sha256 = "173758df4b17d6231b5fe07877e1cfb75378ba2c596ae06173f17efec803bdee",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.1/simProPigeon2-25.2.1-headers.zip",
        sha256 = "fd2b98d22239ee2382db33fc805776c164ce736a5eb3c9ad543ce4bae7a7678d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.1/simProPigeon2-25.2.1-windowsx86-64.zip",
        sha256 = "8b3e88471463f099d4d90a770e0c45c50da77f26df094b1438b0bfd6e14abdbc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.1/simProPigeon2-25.2.1-linuxx86-64.zip",
        sha256 = "7c60977040755e2be6ff9c92e804e37a6772ce19476b2778153aa38ca44ecc1d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.1/simProPigeon2-25.2.1-linuxarm64.zip",
        sha256 = "08e48a6c7606aa3358dafb07c4588e797a3e997952e6864015d567e19de845c4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.1/simProPigeon2-25.2.1-osxuniversal.zip",
        sha256 = "e096d93e0d94720e00764ce52b0a7cd68055e2040f447d6a96e9cd7bc87ca9a4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.1/simProTalonFX-25.2.1-headers.zip",
        sha256 = "fd2b98d22239ee2382db33fc805776c164ce736a5eb3c9ad543ce4bae7a7678d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.1/simProTalonFX-25.2.1-windowsx86-64.zip",
        sha256 = "2b31266eab40976744ef6967470e9cf93853f90bbaf1585766e3b6106928b6cf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.1/simProTalonFX-25.2.1-linuxx86-64.zip",
        sha256 = "22d4cf765df8eab4fab3b4a70fae68a27836209d90694cd2c955fc6330de3183",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.1/simProTalonFX-25.2.1-linuxarm64.zip",
        sha256 = "1fd29ba5dd4632419224f7681fd19c056bc13123033fdb3e3332bdad6739b661",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.1/simProTalonFX-25.2.1-osxuniversal.zip",
        sha256 = "b8ebc3ca64724751ba8bc24646acb9f520db3c1cf1b9f08ac3ffcbea9f04cb22",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.1/simProTalonFXS-25.2.1-headers.zip",
        sha256 = "fd2b98d22239ee2382db33fc805776c164ce736a5eb3c9ad543ce4bae7a7678d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.1/simProTalonFXS-25.2.1-windowsx86-64.zip",
        sha256 = "41f66e430b88273f5c8b1c34672d9ca5639cbbee9e5051889de456413d38b138",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.1/simProTalonFXS-25.2.1-linuxx86-64.zip",
        sha256 = "8513bf29791f6c9c23321f117c97392f4ccb160fa839eebc0c651de7d7b7d567",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.1/simProTalonFXS-25.2.1-linuxarm64.zip",
        sha256 = "51c41aa77b405a2de193b90694e765de722cf2f8c5b5b1672a944c2c1663e673",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.1/simProTalonFXS-25.2.1-osxuniversal.zip",
        sha256 = "29c7a61dc58134293f9ecb69f3bf17bc37be0947d514467ab04930bfa0f34de0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.1/simTalonSRX-25.2.1-headers.zip",
        sha256 = "fd2b98d22239ee2382db33fc805776c164ce736a5eb3c9ad543ce4bae7a7678d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.1/simTalonSRX-25.2.1-windowsx86-64.zip",
        sha256 = "bb91c9571236cc531a193f4ee48745839b7f3bb58c19fdab56afa1e118e10840",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.1/simTalonSRX-25.2.1-linuxx86-64.zip",
        sha256 = "f0a88fdf4f8128505a2fe4c5404329c1b4311de352de52a2620b2735f7f37aad",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.1/simTalonSRX-25.2.1-linuxarm64.zip",
        sha256 = "f1dff6bbd76a43a6ef61eebe8fba6c68e86746327e5d41b70ea3fbf74ba315ce",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.1/simTalonSRX-25.2.1-osxuniversal.zip",
        sha256 = "6f13f409038deac066c69b60b4aa412da1b64d3cb9a491434eaf3fa6e576d7f1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.1/simVictorSPX-25.2.1-headers.zip",
        sha256 = "fd2b98d22239ee2382db33fc805776c164ce736a5eb3c9ad543ce4bae7a7678d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.1/simVictorSPX-25.2.1-windowsx86-64.zip",
        sha256 = "e7cda7be2fd68ff50da839f224adf02a01189500e0552f6d51c8a00fa0e4a7f4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.1/simVictorSPX-25.2.1-linuxx86-64.zip",
        sha256 = "18e5003df367749131ed680415e5386be25d72638491586cb0a80f2adf489f07",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.1/simVictorSPX-25.2.1-linuxarm64.zip",
        sha256 = "270af702f7c6d2798ee81613c9bd299dfdfff2a5f4fd3649a2a4506f680569b0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.1/simVictorSPX-25.2.1-osxuniversal.zip",
        sha256 = "ed2bf363cf509c64c318a6e1e979cce3577b70a7f7d00cb9054420297d232648",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.1/tools-25.2.1-headers.zip",
        sha256 = "838d80bc409b48c7c04a6aab19398fe09cdbcaa4d219038578bd7e449e9c801a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.1/tools-25.2.1-windowsx86-64.zip",
        sha256 = "5e74ea813f4b89803137a546b9709ed32baec291b20d19d74baedb9182d84373",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.1/tools-25.2.1-linuxx86-64.zip",
        sha256 = "aa110800cb23257cba24a5f47da90f2d323e09260f46d1f183c011ae4cf2d975",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.1/tools-25.2.1-linuxarm64.zip",
        sha256 = "56f62b2198c03720d58acabf93ed9e1f4030aed4f836256339a640cec487d2b3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.1/tools-25.2.1-linuxathena.zip",
        sha256 = "95f113516cbf65887736e220050711f6d0e535d6eb21e43342f1fbd029b08032",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.1/tools-sim-25.2.1-headers.zip",
        sha256 = "838d80bc409b48c7c04a6aab19398fe09cdbcaa4d219038578bd7e449e9c801a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.1/tools-sim-25.2.1-windowsx86-64.zip",
        sha256 = "41c6e2dbabdd3c4fcc9de9eaf3434f4fda09f85951ee3ef65c1f967985b674bc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.1/tools-sim-25.2.1-linuxx86-64.zip",
        sha256 = "6e66a27437452d0c73dd3aa704abb230c3f53a11a8ed401cc028de69431491ca",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.1/tools-sim-25.2.1-linuxarm64.zip",
        sha256 = "061546a475679d283ffcb5a68b0bc1496cef39376173c74d3e9732c69345e76d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.1/tools-sim-25.2.1-osxuniversal.zip",
        sha256 = "ac14cc74ee0ae63efaf96d598b8792a98814540bd1d5ca90b632924bb6dfd471",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.1/wpiapi-cpp-25.2.1-headers.zip",
        sha256 = "7b8af0c3b6526fc41f30d3f1bfa7821c938dfc4836e8b984c33522b3adde8415",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.1/wpiapi-cpp-25.2.1-windowsx86-64.zip",
        sha256 = "ffca622d26bffaee537694aca296dc12a50176d09ed38d1c681c704e12e80d70",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.1/wpiapi-cpp-25.2.1-linuxx86-64.zip",
        sha256 = "6d7c05ecc2e100bdf88a8b2b3002929ea17a55a42c034ec19181bc3230c96f77",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.1/wpiapi-cpp-25.2.1-linuxarm64.zip",
        sha256 = "0c78347ea7172944ac4400cf14d490843b3274d0d422de8522a8b640cfaf7ff8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.1/wpiapi-cpp-25.2.1-linuxathena.zip",
        sha256 = "cc73f43b3a5ec4243cfc746540962e12caad402a26e4d5d7ebd0b7af362c93df",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.1/wpiapi-cpp-sim-25.2.1-headers.zip",
        sha256 = "7b8af0c3b6526fc41f30d3f1bfa7821c938dfc4836e8b984c33522b3adde8415",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.1/wpiapi-cpp-sim-25.2.1-windowsx86-64.zip",
        sha256 = "834427b0a311e9859a25c7504f53883e8d1cc028017b3bf467aed0318170d6c6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.1/wpiapi-cpp-sim-25.2.1-linuxx86-64.zip",
        sha256 = "47a62ac3f990128a7c8b52d7d746141288813d2820ed63f4e13021350c5727bf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.1/wpiapi-cpp-sim-25.2.1-linuxarm64.zip",
        sha256 = "8112eba15250f5518704ce2696f97799af6c60858ae17756df9ddf25020735f0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.1/wpiapi-cpp-sim-25.2.1-osxuniversal.zip",
        sha256 = "14c3b35b77a814bc6bed7ae672427e012d64396e849b208dfea99ab733c25e45",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_Phoenix6_WPISim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
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
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.2.1/api-cpp-25.2.1-windowsx86-64.zip",
        sha256 = "1257ac56f206cc6e14130ee9eafecc16040f11e337d0a51a75e93b4ee597aa46",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.2.1/api-cpp-25.2.1-linuxx86-64.zip",
        sha256 = "89cc049485dd696ddd9207f48baec46a34c837dd9c1020f5f65a13e1afd8f71b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.2.1/api-cpp-25.2.1-linuxarm64.zip",
        sha256 = "1c9784467c9ed91498874b1c86e2e3ac06e20d5dcde0f75ae5340b966ebd68bd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.2.1/api-cpp-25.2.1-linuxathena.zip",
        sha256 = "c06c7ec9ab654e6aa2f35562a8d0673aecf559745f7e6d1793e5f35962d5c9bb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.2.1/api-cpp-sim-25.2.1-windowsx86-64.zip",
        sha256 = "6be80e75645f29145b64d04cf57ddc783ede29b6943eb007508da163b916f4ef",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.2.1/api-cpp-sim-25.2.1-linuxx86-64.zip",
        sha256 = "e6995a2a75b7c9617e45dfe815ea6a7f52614b857377a87f56b445a08e9e846f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.2.1/api-cpp-sim-25.2.1-linuxarm64.zip",
        sha256 = "ed2870fed0781c6f952e59cce3d6e1a526d88bf08e67e1e9ed1089313591e86d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.2.1/api-cpp-sim-25.2.1-osxuniversal.zip",
        sha256 = "cd3de258debf2399d0167264e20d756ee16c8e6cdcd97d261bc01ab4a15caf1b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
