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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.1/simCANCoder-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.1/simCANCoder-25.3.1-windowsx86-64.zip",
        sha256 = "cfbe72cb4702a7e9f70bd454fa0bd209e09c6d7e8d18d0b3dc9d358887938430",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.1/simCANCoder-25.3.1-linuxx86-64.zip",
        sha256 = "99f4b47340d2dd443a3588d185b8c454414a6611223c5a1b7e3a88d84dafd303",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.1/simCANCoder-25.3.1-linuxarm64.zip",
        sha256 = "5e56f18123ab3417135498ce3c716fbbaa2ca2cd110de7441d9126b73ae75931",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.3.1/simCANCoder-25.3.1-osxuniversal.zip",
        sha256 = "eeaa16e41407dc6fa5b964e36e2e64378ac3e0ace2f18279a25631eb92505967",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.1/simPigeonIMU-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.1/simPigeonIMU-25.3.1-windowsx86-64.zip",
        sha256 = "779f5c6c14c3bae75d633fcf25ab71c52cd76589cdb29aeec35762334fc317dd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.1/simPigeonIMU-25.3.1-linuxx86-64.zip",
        sha256 = "bb5982e9e4187491e56de17dc7871433fa65424fb5a05b00d0050e43aff31192",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.1/simPigeonIMU-25.3.1-linuxarm64.zip",
        sha256 = "4950c51de0ecf251914170247dfda9348125088c0cc1c3cc8e98408c3271e299",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.3.1/simPigeonIMU-25.3.1-osxuniversal.zip",
        sha256 = "30e18f807559c1e6fa6e4af778312fe26b0308ab793594e39200c242cd47c00a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.1/simProCANcoder-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.1/simProCANcoder-25.3.1-windowsx86-64.zip",
        sha256 = "2dd11b03d062abcd5a7f37a8efe4b0af1001fcd2847a60ac3aa0bb5e59278a97",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.1/simProCANcoder-25.3.1-linuxx86-64.zip",
        sha256 = "5966e0b9cb9f98697c77b5e0fb492e0e0719846e356506fd0516543db5251c8d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.1/simProCANcoder-25.3.1-linuxarm64.zip",
        sha256 = "2260cae8e55f1cc7cb08bffb6e7302c2f257a187e4e7359148f58ef275e3c39f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.3.1/simProCANcoder-25.3.1-osxuniversal.zip",
        sha256 = "a57e5fef5dc015ff938f2e635eb9a15d0908853b49dbead59dfcca82d4afed51",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.1/simProCANdi-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.1/simProCANdi-25.3.1-windowsx86-64.zip",
        sha256 = "c0f54a4dff0b4ebe10f18ea962afa06f077cd28baf08ccd0e9c13f91f9ed43d4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.1/simProCANdi-25.3.1-linuxx86-64.zip",
        sha256 = "323b76db6ac8ed751996d79c56915426b0f7fae27b395d0d1ef3c66916f77c8c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.1/simProCANdi-25.3.1-linuxarm64.zip",
        sha256 = "1e75f8bab2de9771a39f0536e29679fafd69d5fb2733287e1b140cc7367d85fe",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.3.1/simProCANdi-25.3.1-osxuniversal.zip",
        sha256 = "c28b21f8ea083bc2161b78e777967702a8cbf3486b10d6035a0ac751d420a0ed",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.1/simProCANrange-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.1/simProCANrange-25.3.1-windowsx86-64.zip",
        sha256 = "ba657b69465194e2f5503a772608ef0b1c62e68bef4dd1a2c62222793bf5cce8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.1/simProCANrange-25.3.1-linuxx86-64.zip",
        sha256 = "7f53bf20412fd263b14d552889ea5d8564813b4268581826239f01764bb82bca",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.1/simProCANrange-25.3.1-linuxarm64.zip",
        sha256 = "85910bf4eba5bf59a2b8b7b8b4f70f221a6eebf42727ec949d9af7b6d5c027c3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.3.1/simProCANrange-25.3.1-osxuniversal.zip",
        sha256 = "db83407fb512218465debbee698e3e231b0b51111b5c568524f6fc15770f3847",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.1/simProPigeon2-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.1/simProPigeon2-25.3.1-windowsx86-64.zip",
        sha256 = "057e3dad6d2078643954768267a2677c64d0f03c59b821047231a91ea80a1924",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.1/simProPigeon2-25.3.1-linuxx86-64.zip",
        sha256 = "92c49bcad32b7e18e8c333c865242607b600e36d53a652ce6f159f0b19d2b7a3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.1/simProPigeon2-25.3.1-linuxarm64.zip",
        sha256 = "64ceb842abf054537895fc650daee990b22750857fcd19f116835ab98e1e9444",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.3.1/simProPigeon2-25.3.1-osxuniversal.zip",
        sha256 = "74cc5895d21b9541e545479bfc706eaea2eba1a973f9612fa52db4a26170960f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.1/simProTalonFX-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.1/simProTalonFX-25.3.1-windowsx86-64.zip",
        sha256 = "1ba3ea30444779347b6a82a79c8057983f6eec864fc5f57df7072c5e99f6c0ab",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.1/simProTalonFX-25.3.1-linuxx86-64.zip",
        sha256 = "1d455ae9c7d272b1a3ee14384f3aaacb19f54d8618c7ac48d2cec6c1884e787c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.1/simProTalonFX-25.3.1-linuxarm64.zip",
        sha256 = "867cc9f2785cd553db2e95ea72d05f20057e07fbaa9ecdd4a93b39a16c9cdab8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.3.1/simProTalonFX-25.3.1-osxuniversal.zip",
        sha256 = "8f6b1fbd96c47aa49aff6a9164804207f5d13deaae0c4292b4d13ab02a4ad2d0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.1/simProTalonFXS-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.1/simProTalonFXS-25.3.1-windowsx86-64.zip",
        sha256 = "58cee289033888a3c332b7d57c586b5ea2b38a96ee3b27a78eeacb751ab516d2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.1/simProTalonFXS-25.3.1-linuxx86-64.zip",
        sha256 = "42bc667873b8e4990a7683a309aea2affeeb392499fc2d0cf6c6ea573414c8ff",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.1/simProTalonFXS-25.3.1-linuxarm64.zip",
        sha256 = "7b9e7974cc42be145c12bd24161b1170f7a446e015735a0128c07a300e0a9965",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.3.1/simProTalonFXS-25.3.1-osxuniversal.zip",
        sha256 = "d132f371f157b88afed1a9847a22d2c9fad63c317ee84b0f87499b20cacf622f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.1/simTalonSRX-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.1/simTalonSRX-25.3.1-windowsx86-64.zip",
        sha256 = "1083beef5b74c05a7124568e5ced74d3e4bda559cf124e9ad8b4c1bb76bff782",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.1/simTalonSRX-25.3.1-linuxx86-64.zip",
        sha256 = "758fb5e835cfaee815032711df79135c1fede09cc357d884b67b56a317e26663",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.1/simTalonSRX-25.3.1-linuxarm64.zip",
        sha256 = "46c224c19275b46acb23f15223f6f7b6071127e4c8c5b492c4d0d900b5087dae",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.3.1/simTalonSRX-25.3.1-osxuniversal.zip",
        sha256 = "b8da8dfd5430c5cb18450ec21418ca90dcc38f39d834bf61d7aee15d1df34c8f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.1/simVictorSPX-25.3.1-headers.zip",
        sha256 = "79197856ff1f51fb60d0b8b65153f43b710099cdf8d1df33fd6e947f8f0f4526",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.1/simVictorSPX-25.3.1-windowsx86-64.zip",
        sha256 = "55d10144e28a7bbc4bd97132180cd1d49b98e53f1a0d9432112dbeb6155b0017",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.1/simVictorSPX-25.3.1-linuxx86-64.zip",
        sha256 = "af41f7274cedb2bccdcc9966af715122999ae3e17ed9137167d341e5e64ce6a1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.1/simVictorSPX-25.3.1-linuxarm64.zip",
        sha256 = "42293844a9cfbdd7ceba6f34852140cbf3d261e48d6ced037118bb69ef859075",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.3.1/simVictorSPX-25.3.1-osxuniversal.zip",
        sha256 = "be157cf489e5d497a5cb04f331b885ef1d3c7c6edb77042d6a1f79f1160bdbdc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.1/tools-25.3.1-headers.zip",
        sha256 = "efc1c38afb52d7510937035226ac7cf63c2315badfe977440f6ad7e17471576f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.1/tools-25.3.1-windowsx86-64.zip",
        sha256 = "e10711e31a1f68b2d0fa6feb0af5a08306b7d2796e959192c262990ae4a7c8db",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.1/tools-25.3.1-linuxx86-64.zip",
        sha256 = "8bf264996c6f7b5af1df8f36de6e41e028a4901168f6c7e770a6bd99d1ec5fe0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.1/tools-25.3.1-linuxarm64.zip",
        sha256 = "04480136f37bcb0a9759a28f004b75d4b3438a471132da77cf2ac97a707a11ad",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.3.1/tools-25.3.1-linuxathena.zip",
        sha256 = "851f599510c2a386a64f0c3d9da258c15c9e20d0cd41df066dc0cd9073d2631f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.1/tools-sim-25.3.1-headers.zip",
        sha256 = "efc1c38afb52d7510937035226ac7cf63c2315badfe977440f6ad7e17471576f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.1/tools-sim-25.3.1-windowsx86-64.zip",
        sha256 = "4fcf7d27f71d8fb5ec2100b6324700586842a2a1d13ceb50a16dac3e593be467",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.1/tools-sim-25.3.1-linuxx86-64.zip",
        sha256 = "b9be0780a14549a0f3f776c257af1b10e868a8a1588c29c732ec1ca3c6947f3b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.1/tools-sim-25.3.1-linuxarm64.zip",
        sha256 = "e76c18f3546e4675d9000b74ba6ce6c97885c6d9116a737e74d8abb5785c248c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.3.1/tools-sim-25.3.1-osxuniversal.zip",
        sha256 = "878178479d9691cfa683aaed7f7cd4c2662a53c58b8302f9cc6401149db9deec",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.1/wpiapi-cpp-25.3.1-headers.zip",
        sha256 = "7f0e4ce0d297ff334e4020217cbe21d2aff932889aa299c914eaf27c7946ee66",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.1/wpiapi-cpp-25.3.1-windowsx86-64.zip",
        sha256 = "c8ca0fac415596435f85ee3b71b8af0f1a749f80dc9f12a0a727db6acefe5765",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.1/wpiapi-cpp-25.3.1-linuxx86-64.zip",
        sha256 = "c74e723f18359d3281aac7d3760b12340e25beb624587b28b0d29ca4566c5597",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.1/wpiapi-cpp-25.3.1-linuxarm64.zip",
        sha256 = "a201ec43799e30111ff07d28a2e9c1d37b56519c35a9ec3e82b8c51fc9cb4cf6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.3.1/wpiapi-cpp-25.3.1-linuxathena.zip",
        sha256 = "20d191fbc8bae21e28c6a3aa54c86d00be800c9a43f0f22db15a715f904ed3f5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.1/wpiapi-cpp-sim-25.3.1-headers.zip",
        sha256 = "7f0e4ce0d297ff334e4020217cbe21d2aff932889aa299c914eaf27c7946ee66",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.1/wpiapi-cpp-sim-25.3.1-windowsx86-64.zip",
        sha256 = "9129526ea801b9c08ab0bbb4c3a35b25d4c205bce0381ccb454a1502051cefc9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.1/wpiapi-cpp-sim-25.3.1-linuxx86-64.zip",
        sha256 = "c47268e9449e5bef7934064af1842cbe5e55f07da4c18d4bb4374ec9d0cac274",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.1/wpiapi-cpp-sim-25.3.1-linuxarm64.zip",
        sha256 = "f6d23c0d0eafe0551e216d1e20a59596a2211ea1955c9af7952916970f3cdccf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.3.1/wpiapi-cpp-sim-25.3.1-osxuniversal.zip",
        sha256 = "df78d1aad35c0daf59bcaed7132db91aea2f33425ce8e432590927c159720573",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_Phoenix6_WPISim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.3.1/api-cpp-25.3.1-windowsx86-64.zip",
        sha256 = "0b599b8834d6dc0dc22db4a1e3d4d1b140869407331a41f00bf4c7082edfc76f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.3.1/api-cpp-25.3.1-linuxx86-64.zip",
        sha256 = "e5d11fa32b1be72b8b29b0ab694245465f0c982508572ef18cab952a40fbd1e3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.3.1/api-cpp-25.3.1-linuxarm64.zip",
        sha256 = "92b6f2ee40230b2c659bad98a6dfb5ab8badad9912be99fe81e90014bfec56b3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.3.1/api-cpp-25.3.1-linuxathena.zip",
        sha256 = "36e35c985e0cc6e872e420ab8343e4c6648bcf9fca1cf782df1e251f9d64ccd7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.3.1/api-cpp-sim-25.3.1-windowsx86-64.zip",
        sha256 = "0604e69ace425336858c8561278cd11b1659cb7aae7f0d345528c410f25b4625",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.3.1/api-cpp-sim-25.3.1-linuxx86-64.zip",
        sha256 = "2dbbaa9b817e9218af1ed29a2fb5105e202b34023c22fe297366ccbbc31e4284",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.3.1/api-cpp-sim-25.3.1-linuxarm64.zip",
        sha256 = "1ed5ef63ce1addd80dfeef514d12e924792c2c6fcb22efa04ed1203f20fb52d1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.3.1/api-cpp-sim-25.3.1-osxuniversal.zip",
        sha256 = "68e0b575a14820ee7f81cb694ca35d8f5b0fe93f4ec473781e51cdea8da39b2a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
