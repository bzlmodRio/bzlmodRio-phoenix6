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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.90.0-alpha-1/simCANCoder-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.90.0-alpha-1/simCANCoder-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "d5ce250359724e37366f85af17daeb1f150fc4bdcc5727409586e14c9fc12232",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.90.0-alpha-1/simCANCoder-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "7936fe4314aedcb158b1c51b3133fc1e7ab8224554b6a185c3100e344ce05de7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.90.0-alpha-1/simCANCoder-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "510ee40a5c43527132dfd10a04073fc2f1a9e9b5cb3a9758a550511baeb6c041",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.90.0-alpha-1/simCANCoder-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "7bd93f81e52b15eca6609943c55f7fb5995d6114cd848ea1f2b62e70e24e81aa",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.90.0-alpha-1/simPigeonIMU-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.90.0-alpha-1/simPigeonIMU-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "e5a61ad611601f1a7b0fe3bf84001ee4e46f6457931f100608475fd01c41230d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.90.0-alpha-1/simPigeonIMU-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "a2422e62647d1f9d84ecaec7446ab5bb6664e151ed1f5fefa9fcdabaafb2b216",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.90.0-alpha-1/simPigeonIMU-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "0d132ce03612114633d10c22587a05033f134805693a8237c78619ff12fd2409",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.90.0-alpha-1/simPigeonIMU-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "949c718f45f85e028d054e67069b067c49a1b2054dcc0c7bc810ee8bc6a6b236",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.90.0-alpha-1/simProCANcoder-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.90.0-alpha-1/simProCANcoder-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "2e65ab2854258c695b85be4550f9391f9454ad7431ca38b23fb2532019130f86",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.90.0-alpha-1/simProCANcoder-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "ab87723bef15579f0e464d8b25cb94503087e6d7d7f0e5d6608dc13e151ad042",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.90.0-alpha-1/simProCANcoder-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "d6ccc413c4907dce3f391417e6e414f6601c6c27b4c7a13b68830106d3eddb54",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.90.0-alpha-1/simProCANcoder-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "a05dfefb31b5e58fe05710074d1f79a39cfe61e316dd3f8ee00e3ccfa03cdee7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.90.0-alpha-1/simProCANdi-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.90.0-alpha-1/simProCANdi-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "a0acbf5d54eac4e4ff54b65d804cc6980ffde41bdba4ea705a58091efdea3e17",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.90.0-alpha-1/simProCANdi-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "b6c8da2b76da794b55c80d273a447c65f6038b6feb78a5d57bae1aeaf0df651a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.90.0-alpha-1/simProCANdi-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "cee209df40d36ce1c9b0ba6dd11a92a603f48e8249a9de66cbcd1ac3ab36fed1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.90.0-alpha-1/simProCANdi-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "6e004aa7b38ec232c3547355986ce98d38488c49f487fada0d0f63386a792a16",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.90.0-alpha-1/simProCANdle-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.90.0-alpha-1/simProCANdle-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "a6da689b0f230870d22eaff32ff3ffecb61ba2821dba0c659b4deeba96de2eb5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.90.0-alpha-1/simProCANdle-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "a680f7cdb3023258472fb68c50f0762a118424adde3652cc1aa2191cb53e8cac",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.90.0-alpha-1/simProCANdle-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "6f5b2a0d478895e6d7b2b69d4ca5ff66617f2548dd1457b8c4f591c51b3aba57",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.90.0-alpha-1/simProCANdle-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "272b6d6175dfdc9acd9519f2a584bd03e5c4ee8c8fdff0c691dcf117e1bc8981",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_SimProCANdle.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.90.0-alpha-1/simProCANrange-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.90.0-alpha-1/simProCANrange-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "16120c1e916d498391c075324a9b52c9cfac4756c426d2d501ae79c6c96d8c14",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.90.0-alpha-1/simProCANrange-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "e86c5348a4bb5496df490aaf99129032745d1831b4b102ce7d38d03bd27bfbd8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.90.0-alpha-1/simProCANrange-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "728cec00efe2b2638f5cb7c1db3c5a092078e5e2196f6e7ee1331bacddaf4f87",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.90.0-alpha-1/simProCANrange-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "893f12130cc610bcc8d8383177fa4d5d45d059c304284a3a2b028d69b3eb0851",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.90.0-alpha-1/simProPigeon2-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.90.0-alpha-1/simProPigeon2-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "4c97860468fb8385e7a800f3becb23f9babc131e0d4abce3731c13a0e43ab7f6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.90.0-alpha-1/simProPigeon2-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "f5bbf0a709037803f054f7e907040e756b0b06ef3e50c4a474a1ce14c2c64deb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.90.0-alpha-1/simProPigeon2-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "2190c2ba800a43040404dfa570350479eab94ce0692dfff41ceed8fe666de8b5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.90.0-alpha-1/simProPigeon2-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "d2a73265df67b4f077681400f776eb589d1222510d0d979a25a7f410432ec14f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.90.0-alpha-1/simProTalonFX-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.90.0-alpha-1/simProTalonFX-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "09ce038e17b44486e06079bb7fad585af3df1dd2ad2dd8774d07f1b9a6ca9e7c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.90.0-alpha-1/simProTalonFX-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "fe968d05ef595d5ec6649fc0987c7b4c67ea806917cba4f346b4516c331309f5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.90.0-alpha-1/simProTalonFX-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "8db2bb29d3d480213ce64e52f4ac9bdf3a18a57c5e1bac72c59850d6d5a6a12d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.90.0-alpha-1/simProTalonFX-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "9dfde521cf387653f3f483f4f8c19915d64f6e6813270e67037c560b4fedc4af",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.90.0-alpha-1/simProTalonFXS-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.90.0-alpha-1/simProTalonFXS-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "786e9a4e088ca76437b64182e8058c00cd9aa78a59be417093816868de808490",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.90.0-alpha-1/simProTalonFXS-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "a89db9fe27f5245b25583cd027675685d2942f0658b124aa80640755e1a160f7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.90.0-alpha-1/simProTalonFXS-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "263c9bc23c09f23716a70bd19b419625cdd9045b13d45fc62fbcebf5a224e2fd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.90.0-alpha-1/simProTalonFXS-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "18d18acdb0de02e6c6ce6fecaa745d4442ef466bced2e7ee229ff92ff96c254c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.90.0-alpha-1/simTalonSRX-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.90.0-alpha-1/simTalonSRX-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "f8e945b6ff09a5195112c589184084f315cec850e0d5d2bb289ba8e4847a4340",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.90.0-alpha-1/simTalonSRX-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "a11e89fa13e3a24dfb462ac6baeae887a91fc098a438a38a4b537cdc59814416",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.90.0-alpha-1/simTalonSRX-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "a3072d88716c6be5e69e5e85f9e0e72e1907689a130972c080a55f1eac09a008",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.90.0-alpha-1/simTalonSRX-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "8853bb30e9a665434da51350df54cec013cdf039fd9049a31be6b61e67641b59",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.90.0-alpha-1/simVictorSPX-25.90.0-alpha-1-headers.zip",
        sha256 = "5978dca39a2471b18fb851cd42564d6a53a2043d36e098113e4d9a255867ea73",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.90.0-alpha-1/simVictorSPX-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "682f092c06db8ae733e69caa72b2c22e592353703025ece612ba8ec7d59baa75",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.90.0-alpha-1/simVictorSPX-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "370c2b73b49de2c071f2a389027a3c27265b018666cea463a3138d1b60e9f823",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.90.0-alpha-1/simVictorSPX-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "213dea5cbd76ce4d1aebab92b56a516f6a4917bd07348c14e32e4bf96b495965",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.90.0-alpha-1/simVictorSPX-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "7778f23c77649d74da564706f3bc56d4a1f13bf602f851d4d17434ec9a64d92a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.90.0-alpha-1/tools-25.90.0-alpha-1-headers.zip",
        sha256 = "fe8a28ddd9df3fec6842832c6013b9501160f1e22448405feb54f37526257e0d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.90.0-alpha-1/tools-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "31d0843082deaf6e3116f388e5b6b330fb42ca8e4c4d9e3b86ddb9c1f05497d4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.90.0-alpha-1/tools-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "2064dd2e1d26bfa3266efacfc447485880d3ead768b1864e9509630c16d14856",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.90.0-alpha-1/tools-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "1ec14693df0722cc41669ba246871479f008be0358405b6ed2d720ceaa7e07b8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxsystemcore",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.90.0-alpha-1/tools-25.90.0-alpha-1-linuxsystemcore.zip",
        sha256 = "34dc3d65a3a4d3fdbd023cb3c872aa8722969dc40c8db1538975e7ede7dd1a01",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.90.0-alpha-1/tools-sim-25.90.0-alpha-1-headers.zip",
        sha256 = "fe8a28ddd9df3fec6842832c6013b9501160f1e22448405feb54f37526257e0d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.90.0-alpha-1/tools-sim-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "a292263c722632d762be66091a619704fca16eefc2aad46f0bc1e2ff32bc187e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.90.0-alpha-1/tools-sim-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "04e9d1c981f4d18b97aa3246c7c8bfb425989e49677e668c9b416046566d002d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.90.0-alpha-1/tools-sim-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "c9e002b03bf432d93481183b4fe015bb298116660cc93a969e38d2d2e668ae68",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.90.0-alpha-1/tools-sim-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "88c356a69d3399378dbca49580e598b27238a68de4c17c86ebfaa37fd4362a08",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.90.0-alpha-1/wpiapi-cpp-25.90.0-alpha-1-headers.zip",
        sha256 = "f1aea966edd798786fc8a4c1a65805ccb45688981c68363e5536b1b3092e00c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.90.0-alpha-1/wpiapi-cpp-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "fb15e76bd90cea6c3f443c79c6ee5dc2ccc2407f927e2b879fd5c95073e2aa9f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.90.0-alpha-1/wpiapi-cpp-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "697a5807fe216ad977bcafd9e7ab29f44c4c58a583ba739d53ad552c042c3d97",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.90.0-alpha-1/wpiapi-cpp-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "1636894493508eb0470d5d7df75e2d13f629587561c1e091745f8c209ed02fcf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxsystemcore",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.90.0-alpha-1/wpiapi-cpp-25.90.0-alpha-1-linuxsystemcore.zip",
        sha256 = "4643906dcf303fcfc5a777cbdd8500d5e79fd1ace4c8608d41233a92a45a75dc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.90.0-alpha-1/wpiapi-cpp-sim-25.90.0-alpha-1-headers.zip",
        sha256 = "f1aea966edd798786fc8a4c1a65805ccb45688981c68363e5536b1b3092e00c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.90.0-alpha-1/wpiapi-cpp-sim-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "d7032ea9ea4b6d1c7a3a62b577013be26b52aebc0d894df54b6ffba2d3873abc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.90.0-alpha-1/wpiapi-cpp-sim-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "22094760bddb5f813e6241f34cad578d30c0f61805d5bbcb7e89f0e297183f0e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.90.0-alpha-1/wpiapi-cpp-sim-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "df143dbd136ecc0df5a51921408ae3e72c0c41e6b2f24baf9cb6540060d19baf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.90.0-alpha-1/wpiapi-cpp-sim-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "d148285d759cc4e982584bcb4990332137d09eb1f88f99618f08bc25dee4af0a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_Phoenix6_WPISim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdle.dylib @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.90.0-alpha-1/api-cpp-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "4582cd228ff74ad07501000256c961893f17c621004f166f75abafeb0dc37f14",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.90.0-alpha-1/api-cpp-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "be2cc112522d16e654b0f6cf8138e897ce496cf967628ff8d71cea7d1590f0ba",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.90.0-alpha-1/api-cpp-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "51e51ffc776e0321116f1ea62c929e78cfaac92c2c82f68f396dda760ead8f0c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxsystemcore",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.90.0-alpha-1/api-cpp-25.90.0-alpha-1-linuxsystemcore.zip",
        sha256 = "d22f6c936251b811e5c3d5c2ff126fcd965080e0262b34be2bfa6cd29323459b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.90.0-alpha-1/api-cpp-sim-25.90.0-alpha-1-windowsx86-64.zip",
        sha256 = "c6203e8c14f8b0dee3089d8139a8d6e375cf4cac7c46d76664a0a252cc45c69f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.90.0-alpha-1/api-cpp-sim-25.90.0-alpha-1-linuxx86-64.zip",
        sha256 = "99ff6333f8b6c658302519d7da6e457de60e6a592a10f9684aa75c278dcca629",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.90.0-alpha-1/api-cpp-sim-25.90.0-alpha-1-linuxarm64.zip",
        sha256 = "36cb2fdb493aa6d9acf2e19a6ad9bfe62d2babefd3f29e09307ac333ae5045e9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.90.0-alpha-1/api-cpp-sim-25.90.0-alpha-1-osxuniversal.zip",
        sha256 = "688ec3a94f5316fc2cec9dcbfd1df88c615cd8aa82751214b9651a26060bfd21",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
