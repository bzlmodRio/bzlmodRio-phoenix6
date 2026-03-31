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
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.2/simPigeonIMU-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.2/simPigeonIMU-26.1.2-windowsx86-64.zip",
        sha256 = "dd6b3e7c03302a012595b495a32c0ff3f1fbc5f92af680f302fe5b9975384428",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.2/simPigeonIMU-26.1.2-linuxx86-64.zip",
        sha256 = "d6a6ed8b4253b3d0043f8983a2c6ce1cbf7d7be0e49d6fc7a8aca8c3f5d1159b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.2/simPigeonIMU-26.1.2-linuxarm64.zip",
        sha256 = "35b05cc36182cc2188ce446bdcb4b3d18484c14585e4ccaa4b7797a6c9da1364",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.2/simPigeonIMU-26.1.2-osxuniversal.zip",
        sha256 = "1dfb8cce9e1d5cd83274b03eb76c8cc3f0e31a91e9dc78dae8f92d511f29370a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.2/simProCANcoder-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.2/simProCANcoder-26.1.2-windowsx86-64.zip",
        sha256 = "14f28aa3708afdfe1dde8dfbf8dae242b357b165c530839131b46f22ed84b241",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.2/simProCANcoder-26.1.2-linuxx86-64.zip",
        sha256 = "152ca51f473cf96959a3961ca0f5ef347e2efe90f1766e4233f621c3d53190de",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.2/simProCANcoder-26.1.2-linuxarm64.zip",
        sha256 = "7a7b3e63f7438b8da1e8ec096a778c49bcdb948461eb155b219ce2713154d9c9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.2/simProCANcoder-26.1.2-osxuniversal.zip",
        sha256 = "d3c1b95e5c29a0aba983738f28a31a9457f38533caecfb9dd9c1158ec1999a47",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.2/simProCANdi-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.2/simProCANdi-26.1.2-windowsx86-64.zip",
        sha256 = "08742f5d4bd5b632258411272dea5e6a76d94b1dda17b77c4da5568417bc5659",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.2/simProCANdi-26.1.2-linuxx86-64.zip",
        sha256 = "f37687ca04f976b65f2e3b90ace236c682cf756b04e29baaaa803b73617f5bb7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.2/simProCANdi-26.1.2-linuxarm64.zip",
        sha256 = "8bac9bf960fbd78c727919c464988cd28957595e438f6a150eb40ad0daa83836",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.2/simProCANdi-26.1.2-osxuniversal.zip",
        sha256 = "460aa16e9a74bf109f568b1fc11cbff9247ffac9360f8657d44a316ec7500ac1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.2/simProCANdle-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.2/simProCANdle-26.1.2-windowsx86-64.zip",
        sha256 = "c1fbade1e06c62ed0efe210287f20966b33ae1bbf6e8831682f1ce9e49ad7b95",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.2/simProCANdle-26.1.2-linuxx86-64.zip",
        sha256 = "df343a1b193a09eb4ff2cb96a9bb3b929c306abe379bfa09fd3e9a9a55f4beeb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.2/simProCANdle-26.1.2-linuxarm64.zip",
        sha256 = "335cbd712f73fc098d0e9dd1a690f4fa5bcc8ba8e39a215c7a1abd531dacac37",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.2/simProCANdle-26.1.2-osxuniversal.zip",
        sha256 = "f3625ea8d9d33646d8210a9532e652006a6cff1bd266f7cd71372cdc0a1e44b3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_SimProCANdle.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.2/simProCANrange-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.2/simProCANrange-26.1.2-windowsx86-64.zip",
        sha256 = "e627647bc2afc42172bb1ed6e3ee96512b869787327d6ffd4296dbe1592bcf0a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.2/simProCANrange-26.1.2-linuxx86-64.zip",
        sha256 = "b0515dbde314d9a0cc6c08aed1a8826a9010fd87e6667936c23c8479121a99ea",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.2/simProCANrange-26.1.2-linuxarm64.zip",
        sha256 = "c195d53369c29198c3092e4bce31c465952488bb443a67d1d62d0e991b2d863d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.2/simProCANrange-26.1.2-osxuniversal.zip",
        sha256 = "717ce90998c1525580cdf21231236816bb598357d7d3be48391986445c6c9701",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.2/simProPigeon2-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.2/simProPigeon2-26.1.2-windowsx86-64.zip",
        sha256 = "225b7702771cae130938cfb1d3f3e1ffc94078af4083fbfa1da0ab60bc06fd74",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.2/simProPigeon2-26.1.2-linuxx86-64.zip",
        sha256 = "f30ac1432cc1dbc371f59240b0df780b44543da719b43cfffa357aeeebfa9e39",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.2/simProPigeon2-26.1.2-linuxarm64.zip",
        sha256 = "694c9f671076a5a16f92f101c791b618fd2647b2d85557005461d0865070d56d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.2/simProPigeon2-26.1.2-osxuniversal.zip",
        sha256 = "f186807f2b89d68e81ef7a57f7c15ac569d56d77238fde2fc08dfd3398c688f6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.2/simProTalonFX-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.2/simProTalonFX-26.1.2-windowsx86-64.zip",
        sha256 = "719aed4cff1b210db811b37b7c96a37baf99ba80c3e904caa097805d12cc5791",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.2/simProTalonFX-26.1.2-linuxx86-64.zip",
        sha256 = "bb781428d01e7ffd5b4a4927fb4821dc51690419718f78585d63132b8cd328fa",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.2/simProTalonFX-26.1.2-linuxarm64.zip",
        sha256 = "c2b39b5c6dc96700cb541d4042adb1226e04e13b03422c9b32a245cfbc6a28fa",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.2/simProTalonFX-26.1.2-osxuniversal.zip",
        sha256 = "ca23ce31b1b8bd248ddeca3405b2545332c01caabaf4ccf12cb890b9c694b403",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.2/simProTalonFXS-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.2/simProTalonFXS-26.1.2-windowsx86-64.zip",
        sha256 = "4a0289e3af35b5edac71f0ee21ef738494b867162c06bbcc07d86f67a0465041",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.2/simProTalonFXS-26.1.2-linuxx86-64.zip",
        sha256 = "96944b560796dd0d5dbe37387b10d0fc6fbe9965400d6da8f659e05c28f113c5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.2/simProTalonFXS-26.1.2-linuxarm64.zip",
        sha256 = "4fc04e958b21d6ab9bba3c4852e9a9a937313043caf6453fe8091474330513ca",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.2/simProTalonFXS-26.1.2-osxuniversal.zip",
        sha256 = "38046cb65f6ed6a7ab3c8513cccb46051eea67a5fe986b3b53f4bdb3bc8cb452",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.2/simTalonSRX-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.2/simTalonSRX-26.1.2-windowsx86-64.zip",
        sha256 = "9f7104513586b3c74e2c8b7cfb1b11b119753f79972a46e79ef444781b829175",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.2/simTalonSRX-26.1.2-linuxx86-64.zip",
        sha256 = "4b6e739478077566afa711871d279cb707c9f24e3d9b9d2c8ecf37a2d6511b06",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.2/simTalonSRX-26.1.2-linuxarm64.zip",
        sha256 = "e23f6accd97f783cc18a6ce203fac7196b5583edf2252ed30fbf9cb0d3c92d4f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.2/simTalonSRX-26.1.2-osxuniversal.zip",
        sha256 = "0940fbef7a2d45d89fc560dbcf24a0476abf2fa60235fe0db47b64a31f8038dc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.2/simVictorSPX-26.1.2-headers.zip",
        sha256 = "d53f1ea2ef42decd9a5c42f3c8c2ce64bfa850bfbf4fe28fb28f9b64bcbbaa1f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.2/simVictorSPX-26.1.2-windowsx86-64.zip",
        sha256 = "6bfb6d8a7a2748be0c6cd0291646fbf782fe3a4559dedfea4ce1d6a264fdb178",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.2/simVictorSPX-26.1.2-linuxx86-64.zip",
        sha256 = "2fe9298b29988e58cadb0eb6b231182ea838fa744ba58c444562dab15f31c866",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.2/simVictorSPX-26.1.2-linuxarm64.zip",
        sha256 = "365305b09303c252ff714a33ead4999962524ac04fb0508f3b7c62849fb2af62",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.2/simVictorSPX-26.1.2-osxuniversal.zip",
        sha256 = "61218ea84ee624114341a9ea4c4d75f7cbee5fb9573eb58d6a01eaeb91a37e05",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.2/tools-26.1.2-headers.zip",
        sha256 = "5a0bcd54ccd9904401f131f1f2621e7add72ab2dcb47dcc30e554740d2e74729",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.2/tools-26.1.2-windowsx86-64.zip",
        sha256 = "81180893657cf79315d020b7f431c4d08ada7a0bfdbc786f2388029bcfa8c046",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.2/tools-26.1.2-linuxx86-64.zip",
        sha256 = "8aab354c5f6d2c0a81036dcf67ce42165366041b636e4422657530d209fad550",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.2/tools-26.1.2-linuxarm64.zip",
        sha256 = "8d139ac3e0f0380d52d1bffe31a941fb36576ab7b40bf3f5277b371567d40004",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.2/tools-26.1.2-linuxathena.zip",
        sha256 = "227675facdadc77bb1b19d7577ea918497f480b65a77fb6a75f45d933b1a8eef",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.2/tools-sim-26.1.2-headers.zip",
        sha256 = "5a0bcd54ccd9904401f131f1f2621e7add72ab2dcb47dcc30e554740d2e74729",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.2/tools-sim-26.1.2-windowsx86-64.zip",
        sha256 = "bc6a95e976974f6e164b56068aed03adb00734e8b14e09a05f5b7739b9aa1b75",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.2/tools-sim-26.1.2-linuxx86-64.zip",
        sha256 = "962cb6a7674c278077c3b043125049240a39fae69550adb5bb1d0dcffc0daf40",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.2/tools-sim-26.1.2-linuxarm64.zip",
        sha256 = "ca65a5290fb46d5b2cfd2eaa28823a2bf35251f233381eed19f99a6ae0172612",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.2/tools-sim-26.1.2-osxuniversal.zip",
        sha256 = "4c2d4cf031ad8e43337b1a4fd01bf96738895fbe4831754b54e2802d7e698f3d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANdle.dylib @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.2/wpiapi-cpp-26.1.2-headers.zip",
        sha256 = "7ee7aa9eeaef0152ab827c061ee0618fea4833d5333f9b8f561b2baa57ff6df8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.2/wpiapi-cpp-26.1.2-windowsx86-64.zip",
        sha256 = "3c0f6714e7586c340bd67c533f773ea2ca15f1b97b2534c7868089e6e0d64e31",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.2/wpiapi-cpp-26.1.2-linuxx86-64.zip",
        sha256 = "a8117e8c9bb2e1c4c177a8c47bf1a7e33ba491434fa0aa99f23d79767eb48c7a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.2/wpiapi-cpp-26.1.2-linuxarm64.zip",
        sha256 = "9163b14b48dcce74e2869348770910fe1ea21e1a8e9ee8c7b78b4fe7624b6b6d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.2/wpiapi-cpp-26.1.2-linuxathena.zip",
        sha256 = "50b880b813372673c14901ac7885c33b22a6102ad15c69e30f8ff3954600a82c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.2/wpiapi-cpp-sim-26.1.2-headers.zip",
        sha256 = "7ee7aa9eeaef0152ab827c061ee0618fea4833d5333f9b8f561b2baa57ff6df8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.2/wpiapi-cpp-sim-26.1.2-windowsx86-64.zip",
        sha256 = "1b1034890ccd7a6ad5cb7fa40a6c8bf89e90863ed3c2184dc512b8faa44acf34",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.2/wpiapi-cpp-sim-26.1.2-linuxx86-64.zip",
        sha256 = "6903fc1608d9a8f6eac822e3b7d8e113c19aa315b475bd2833f71507c71d5799",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.2/wpiapi-cpp-sim-26.1.2-linuxarm64.zip",
        sha256 = "505d099deef4864adf037319bbbbaca34cd6da331fa7f0d567fd99c300699b5a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.2/wpiapi-cpp-sim-26.1.2-osxuniversal.zip",
        sha256 = "c5a19ec226b8e7c220898c9234bbc67a4bfad4e2128d9d03b9902074b07675e3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_Phoenix6_WPISim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdle.dylib @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.2/api-cpp-26.1.2-windowsx86-64.zip",
        sha256 = "fed8fc6774e27d86d98260bc4e0debdc2503382d43ab79a1db555ca85b957f3d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.2/api-cpp-26.1.2-linuxx86-64.zip",
        sha256 = "b3cf26c552e2d3f4808a023a1608aef29a55839fc6e220b020bfb6394c2566cc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.2/api-cpp-26.1.2-linuxarm64.zip",
        sha256 = "6ff77ad8193d7f741e3910c5c16ad18d845267592a4bd73fd2cae7dd1b7c742d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.2/api-cpp-26.1.2-linuxathena.zip",
        sha256 = "f4fbcbe2ad839b283e955bd5550fe13294f0d548c4b3f7d8826e192f68241896",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.2/api-cpp-sim-26.1.2-windowsx86-64.zip",
        sha256 = "5b80da6e4ef56d4faddbc91d8f2c3c79443200d27dab1b92ef5883bcf7e3b3b4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.2/api-cpp-sim-26.1.2-linuxx86-64.zip",
        sha256 = "f4ff12a34f2965f93e0dffe6c6b39cd32084c802405687736f8b254fd8ab0864",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.2/api-cpp-sim-26.1.2-linuxarm64.zip",
        sha256 = "17f7d4686baaa362183a1eaacbad12e33e0ae6e922e138d97569c8b5953bb832",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.2/api-cpp-sim-26.1.2-osxuniversal.zip",
        sha256 = "6e4a4b25b9984f7e162a81be18b628e70591d0b3d291ed1cb8327826b6c62ccb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
