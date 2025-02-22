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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.0/simCANCoder-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.0/simCANCoder-25.3.0-windowsx86-64.zip",
        sha256 = "92a0eb56f1761cbcc5f375607a3fc8b8d24d2fce5019c57b1638229beed4d232",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.0/simCANCoder-25.3.0-linuxx86-64.zip",
        sha256 = "30879605d09b1d205db86abe86e87743a0a6a820f40b306f0dbd9a8f201b043b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.0/simCANCoder-25.3.0-linuxarm64.zip",
        sha256 = "d5c5fa71f7e05c94c14a5e2de50121b2103c0f37ef48c9d81cd6e488d3f8df93",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.0/simCANCoder-25.3.0-osxuniversal.zip",
        sha256 = "41d007a95d70e66c1171707f775e138f83fdaeef5b1d8ffd2ec4a380e5129a25",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.0/simPigeonIMU-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.0/simPigeonIMU-25.3.0-windowsx86-64.zip",
        sha256 = "36b39c5406fcf01b10ac5adc8bd78e0c6c9f58cfb3034a0b33f0b0892a82e19b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.0/simPigeonIMU-25.3.0-linuxx86-64.zip",
        sha256 = "7420a2b9305f70816b77f84b0e361271cadf338bde81d2f50b684f8ea421b569",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.0/simPigeonIMU-25.3.0-linuxarm64.zip",
        sha256 = "aeb05cfe3214d56e5da81079bf1ef8296aef9d043412a1c8209cf290f1892a19",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.0/simPigeonIMU-25.3.0-osxuniversal.zip",
        sha256 = "64ecc8e76be26d99d96606c6ef96ab54b8741ca656f569857228869b2c43dc91",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.0/simProCANcoder-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.0/simProCANcoder-25.3.0-windowsx86-64.zip",
        sha256 = "e1bb4e344f978eb8cc1adb7ca524d6e9f24525411cf818b2b7632986b52caef6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.0/simProCANcoder-25.3.0-linuxx86-64.zip",
        sha256 = "5cb678c91d7587c247cb0f7a0adc01f926752ccc579d4133dc5ad5e6335e9a30",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.0/simProCANcoder-25.3.0-linuxarm64.zip",
        sha256 = "47c52ff07117f0fec0c472096769a5dbcc1de606a1a6cb931ee633a9b3a86170",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.0/simProCANcoder-25.3.0-osxuniversal.zip",
        sha256 = "58f659a7cf6c8d8d364a5ed1e5fd556f8510e59422716fd544e816695151d3b7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.0/simProCANdi-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.0/simProCANdi-25.3.0-windowsx86-64.zip",
        sha256 = "e7aae58219d787818982213fda2748ac8d86d538b12e9c6ffd2f8150c480fca6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.0/simProCANdi-25.3.0-linuxx86-64.zip",
        sha256 = "76792e3c3114b6bac3adf6b06a95622c785207dabc9c5ec4dc7b188d7f65239a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.0/simProCANdi-25.3.0-linuxarm64.zip",
        sha256 = "3b834f78a31dd9aecd92d756d1b914fb8771dbc3d16f6eaa7c47dcecc6c1e7db",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.0/simProCANdi-25.3.0-osxuniversal.zip",
        sha256 = "93a864cc86c1365a5545882d42087c6489df5b0728c7be17f2f92c5fa1022c92",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.0/simProCANrange-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.0/simProCANrange-25.3.0-windowsx86-64.zip",
        sha256 = "a59e416ae31c52a2915725a44061eea6a5e51f6d36ba24b86d4a1d9ed1925d51",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.0/simProCANrange-25.3.0-linuxx86-64.zip",
        sha256 = "b8b16c37dcc57ca34dda43bb0be476ffb474b302d66d9c2778b10657234e1dae",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.0/simProCANrange-25.3.0-linuxarm64.zip",
        sha256 = "bc44c13271ac551f25a6ea0d35b3c9e9263701242f77bf086e4cdb31464cd957",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.0/simProCANrange-25.3.0-osxuniversal.zip",
        sha256 = "3af73892a11a06a45e9aba7f8e00f91f733b4f5c9c1ea669f23daf0994d49414",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.0/simProPigeon2-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.0/simProPigeon2-25.3.0-windowsx86-64.zip",
        sha256 = "d39ec74ecf252fd388151ad16bdd1b539b46c1b0e4bbebca69da1fbd458ea399",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.0/simProPigeon2-25.3.0-linuxx86-64.zip",
        sha256 = "262eb1829b42311f65618d0ddd7791deb8ed1d8ca259edf1996ba7e63f283097",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.0/simProPigeon2-25.3.0-linuxarm64.zip",
        sha256 = "003b075fb3a4dac45a4a8a0a2969473f6ef48d47b12918e745ef8f1de78feaa1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.0/simProPigeon2-25.3.0-osxuniversal.zip",
        sha256 = "41b1703c662a3ef4b8d77efdeb28a0120d997090c5d9a4d5bc58c44004c2a7de",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.0/simProTalonFX-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.0/simProTalonFX-25.3.0-windowsx86-64.zip",
        sha256 = "75c0992f94a8f426007d198f97054a815749894238c91fe679ac93391e6190f6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.0/simProTalonFX-25.3.0-linuxx86-64.zip",
        sha256 = "c78061ac8fba7d79823ea490162255721d4f535a2bbf70049e423bfa655d4810",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.0/simProTalonFX-25.3.0-linuxarm64.zip",
        sha256 = "3aae2d89cf941ac9b789c8efede73e6dd60fac7fc7ac34c7177ac936dcd7c9f4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.0/simProTalonFX-25.3.0-osxuniversal.zip",
        sha256 = "32b17eaba937d3bda8343683b555e764c7c8c231166e175bc13f221dbd7239a9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.0/simProTalonFXS-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.0/simProTalonFXS-25.3.0-windowsx86-64.zip",
        sha256 = "d095c560066ebe5c1d6811dc21f70a04bfff156e43fefdb5c1c08ab0e699615f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.0/simProTalonFXS-25.3.0-linuxx86-64.zip",
        sha256 = "9af028e50e853f9938c7d52bf7d90a131bb0430a3ab67ef679b30baad9fa2f4a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.0/simProTalonFXS-25.3.0-linuxarm64.zip",
        sha256 = "08160af8c1f43fbd5019f050927c8029d1134df2cf81f17c078b8d1e1c51f5ef",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.0/simProTalonFXS-25.3.0-osxuniversal.zip",
        sha256 = "6eed652c22df2e84e7b57fe40a8c01e2f0b4d4853acd0867cf861b6732a72fba",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.0/simTalonSRX-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.0/simTalonSRX-25.3.0-windowsx86-64.zip",
        sha256 = "d2a6921b43de2480e4532d5449bb1ac643fb73fa1a3fee3322acd9aa44f5f19d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.0/simTalonSRX-25.3.0-linuxx86-64.zip",
        sha256 = "8cf815d9aac0df40b3f62cdc2522454d8b9b6522b80610082af472259c766e30",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.0/simTalonSRX-25.3.0-linuxarm64.zip",
        sha256 = "18b4ecbb0771531b4a4d6b322d4486b4a745ce8cc141b2674c9dcb0a77181274",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.0/simTalonSRX-25.3.0-osxuniversal.zip",
        sha256 = "48e7d87e0dd4c85c99d4e925a808761d35ad24eadce6888817b89d76263d24b0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.0/simVictorSPX-25.3.0-headers.zip",
        sha256 = "d9fab51340476b62964f22110f149551fa9673e3f67611ce18d14ad9935132ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.0/simVictorSPX-25.3.0-windowsx86-64.zip",
        sha256 = "c8225abee27bdfcc4c6abce69f4882101c3fac129b4a14ee7e4613f9ede82e87",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.0/simVictorSPX-25.3.0-linuxx86-64.zip",
        sha256 = "b50d502fd2785f144830202464658086a12969790a956d59f79f461c9db038fe",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.0/simVictorSPX-25.3.0-linuxarm64.zip",
        sha256 = "e2efcc8395e42054e23b2af718cdb4e16b40ed752ea80b5060e2fa4037406b21",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.0/simVictorSPX-25.3.0-osxuniversal.zip",
        sha256 = "755dd1b0a2b8e050601f953af2e9b0775d2be6ad3067261d25155e4237fcb087",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.0/tools-25.3.0-headers.zip",
        sha256 = "f67c8c440d32c8bf8642f4ff509e5610b02671d3674c0e0abee1880ed1635ebf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.0/tools-25.3.0-windowsx86-64.zip",
        sha256 = "140c15f79529c682b52c7f1ff89a91ea77594b2a63bd8652521b4c8dd8afca98",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.0/tools-25.3.0-linuxx86-64.zip",
        sha256 = "b01e8823e485f62f9476bd2001eeec141ec41d9c63d3151c9fe1afd0993acc5f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.0/tools-25.3.0-linuxarm64.zip",
        sha256 = "b147e274f35279918866ab777d4c3d9cb85be1d11b7b9ec6fedcb6d8d79c9ef8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.0/tools-25.3.0-linuxathena.zip",
        sha256 = "3e05e94c744a9e0ec1e621df58c55d6f83f95089251357d09de0919be13b7927",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.0/tools-sim-25.3.0-headers.zip",
        sha256 = "f67c8c440d32c8bf8642f4ff509e5610b02671d3674c0e0abee1880ed1635ebf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.0/tools-sim-25.3.0-windowsx86-64.zip",
        sha256 = "93c70135f3fab5c6f983c6ceacd56cd3ad6dcc2d4ec832fe6a7c75d5d5aff17a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.0/tools-sim-25.3.0-linuxx86-64.zip",
        sha256 = "87f549d7242c88679191146709c7edd97a86448c0faa3476898fb53d9969b283",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.0/tools-sim-25.3.0-linuxarm64.zip",
        sha256 = "26d7494bc00cd92c1e5ea224b8bc277b788103f43b5485b9233e2f8af067c7b4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.0/tools-sim-25.3.0-osxuniversal.zip",
        sha256 = "38acd5e4d5417abb166a144083f9115baea09be64337239ce77c2b4201a2bdea",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.0/wpiapi-cpp-25.3.0-headers.zip",
        sha256 = "dba5539714e05f4eb6048a10fbc014768da14ac1103b55bc72ff17d2dff5404b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.0/wpiapi-cpp-25.3.0-windowsx86-64.zip",
        sha256 = "17445730e4696776801e8cc1d71a836e12e20de5f3b57df12c7e885562a80fac",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.0/wpiapi-cpp-25.3.0-linuxx86-64.zip",
        sha256 = "36c7c4766f3524bc04a6705ba58dde5cb0f8732171c0691c452aa6a21666233e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.0/wpiapi-cpp-25.3.0-linuxarm64.zip",
        sha256 = "6a6cf0a86a3cc46dc9062aca6e83d9ce433c868817cff058301f2429c28855da",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.0/wpiapi-cpp-25.3.0-linuxathena.zip",
        sha256 = "3e9774fcbc853278ff547b007dcbd3e1305b656ff92e7a4293d776ac062b5e35",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.0/wpiapi-cpp-sim-25.3.0-headers.zip",
        sha256 = "dba5539714e05f4eb6048a10fbc014768da14ac1103b55bc72ff17d2dff5404b",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.0/wpiapi-cpp-sim-25.3.0-windowsx86-64.zip",
        sha256 = "fc94845032af38c9f9256027e6e0689ef1c9354718e3b7276f4e9f45d84b3a16",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.0/wpiapi-cpp-sim-25.3.0-linuxx86-64.zip",
        sha256 = "71e18fb70205d747cc811ad54b956f7ffb6dbb5632a88482d0c7cce814cfb74e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.0/wpiapi-cpp-sim-25.3.0-linuxarm64.zip",
        sha256 = "6b2ad97a62a14c5d9069b92a7c8050c7ac16ba4facbaaa791442a04aea799442",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.0/wpiapi-cpp-sim-25.3.0-osxuniversal.zip",
        sha256 = "d60bdb4901d234595ae2a625f170d6dbb412fe3d822efde25100444689c89f4b",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.3.0/api-cpp-25.3.0-windowsx86-64.zip",
        sha256 = "2b82c4fff519c487e2550582660b4f93a89ad4d34cdcad2e059f01d21eea4f44",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.3.0/api-cpp-25.3.0-linuxx86-64.zip",
        sha256 = "7241b9a19f7665cb73c8ae977f06489c146f560330f61a091dc50ae94f611dda",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.3.0/api-cpp-25.3.0-linuxarm64.zip",
        sha256 = "1fbaf24461921b5f857798415111c2131529b9359e16e1359030ec61a9558047",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.3.0/api-cpp-25.3.0-linuxathena.zip",
        sha256 = "3a20d423d7f7422cb6167149a5024103b43d70ef7f7b55e19ec307e9d162e60d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.3.0/api-cpp-sim-25.3.0-windowsx86-64.zip",
        sha256 = "ea083dca342f893eaf1c11ab20cb91c1ff23651711ef4eec5587b889fbd2efba",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.3.0/api-cpp-sim-25.3.0-linuxx86-64.zip",
        sha256 = "386b5242bdeb37277b2180fcf50d96755e924a1aef7a509daedb37f8eb0960d4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.3.0/api-cpp-sim-25.3.0-linuxarm64.zip",
        sha256 = "bdcf9cfed37792bf5adaa3a12a355449898127318f88502fcb29a22242610e8e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.3.0/api-cpp-sim-25.3.0-osxuniversal.zip",
        sha256 = "599197c15f9d1df54a0a02cc88356bbeed50a4157a191120667eb234406dffbb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
