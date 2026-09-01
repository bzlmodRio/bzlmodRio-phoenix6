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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.3.0/simPigeonIMU-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.3.0/simPigeonIMU-26.3.0-windowsx86-64.zip",
        sha256 = "55b1423905a4dea09bf62becc146e672c8617209edc098e8f2fd32e71f5dab09",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.3.0/simPigeonIMU-26.3.0-linuxx86-64.zip",
        sha256 = "a67976d1c9871ecb5500a7c4183055c8749d380859b1d89096a83378d27fe708",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.3.0/simPigeonIMU-26.3.0-linuxarm64.zip",
        sha256 = "96ce95f9c39856922d4a92ebbaf1b1da1844fea213aab369f4ba4c2a17272f73",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.3.0/simPigeonIMU-26.3.0-osxuniversal.zip",
        sha256 = "fb94de384a5f4cbd5956c9cd50a0b61027a42faa2991ec501d915af7350c29b6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.3.0/simProCANcoder-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.3.0/simProCANcoder-26.3.0-windowsx86-64.zip",
        sha256 = "937666af54f034ce4c986636b96716dfaa644e8c7b0b477a32fc52dc2c01a5cd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.3.0/simProCANcoder-26.3.0-linuxx86-64.zip",
        sha256 = "b180b85d563bed8dcafd7169351823d8dcbd74d2e239d15a51d3026e370cef01",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.3.0/simProCANcoder-26.3.0-linuxarm64.zip",
        sha256 = "390eefdac17796a7be535fbd022193006b4dd1015892d3c17ff7cffd69118789",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.3.0/simProCANcoder-26.3.0-osxuniversal.zip",
        sha256 = "f16a7a09ca50f5cdd6bb4a10e03956d0b1b0cfb7505eedb420cd46b4c52d5045",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.3.0/simProCANdi-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.3.0/simProCANdi-26.3.0-windowsx86-64.zip",
        sha256 = "fe56b8f910cf5f7f7baed4c86ec1f609a9479406e424a3f5b71e681878064357",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.3.0/simProCANdi-26.3.0-linuxx86-64.zip",
        sha256 = "4e487e0698b9d5e69c75ce1b7280362b8d89e2ad9cc109fde279c1bce0ed4fad",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.3.0/simProCANdi-26.3.0-linuxarm64.zip",
        sha256 = "d429849eef0a1b89d59ac50cace380f53819e10f315f62f4a993b27f4c8f6a63",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.3.0/simProCANdi-26.3.0-osxuniversal.zip",
        sha256 = "14aba1951d89dff5378676386e0f580e633406a7602e05471dd8c21eecb797d3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.3.0/simProCANdle-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.3.0/simProCANdle-26.3.0-windowsx86-64.zip",
        sha256 = "09afed8fdb967e412cf4a7dcf3dd1f67859f37c69dd5b50a2a00590d60a3eb3c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.3.0/simProCANdle-26.3.0-linuxx86-64.zip",
        sha256 = "518edc8974cd49277e3046819300320089aab4cf6a6d4f16a1be04467d36953c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.3.0/simProCANdle-26.3.0-linuxarm64.zip",
        sha256 = "125159d22f98b6f0bc2b649cb0b1d24cb0ad9f3646bae2c1e8ca96cec78e5412",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.3.0/simProCANdle-26.3.0-osxuniversal.zip",
        sha256 = "a8446933525a60e55779129fccdd559f0733a3edc435cd25b8005b9a81be5eb9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_SimProCANdle.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.3.0/simProCANrange-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.3.0/simProCANrange-26.3.0-windowsx86-64.zip",
        sha256 = "5b9a3f1fd3c0c9fdb420e46dc4d360b2e35b284f7374c561082e8268e8551ed9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.3.0/simProCANrange-26.3.0-linuxx86-64.zip",
        sha256 = "aa7cf0c015a2cdbf6d985361743548e3ea3c09d2eb61e1d4dbf86b5a520bdef8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.3.0/simProCANrange-26.3.0-linuxarm64.zip",
        sha256 = "e68d639bb3bee7aa1140bec721f6e4f4134d292c048054d0d75c6369e8dde49a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.3.0/simProCANrange-26.3.0-osxuniversal.zip",
        sha256 = "4c66017c4385f0331fcd11712c21d5a7dd176d993b6f670f5c324e70ec575b2f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.3.0/simProPigeon2-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.3.0/simProPigeon2-26.3.0-windowsx86-64.zip",
        sha256 = "fe936b42f99c4d45ec0be505072b910525698350ed0baf4cba0f45fb0801119d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.3.0/simProPigeon2-26.3.0-linuxx86-64.zip",
        sha256 = "b1f1b7c560040442242b2e02c3eef0ef4eaf5169c9ab5a2b01fbdd80b82f8f37",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.3.0/simProPigeon2-26.3.0-linuxarm64.zip",
        sha256 = "69a05918ee4e6eca3ebfdd9c2eff68d7e33ac25e9c19a1ce5f2c3b30199e9bf0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.3.0/simProPigeon2-26.3.0-osxuniversal.zip",
        sha256 = "cce3a6f31f2b0c268ed02a2b2fa0f9c6222631b849f57e5af35554742afdadff",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.3.0/simProTalonFX-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.3.0/simProTalonFX-26.3.0-windowsx86-64.zip",
        sha256 = "df60d9a19c9eea506ac996c429ac995279a7a4eb02467954bdee1e490a152907",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.3.0/simProTalonFX-26.3.0-linuxx86-64.zip",
        sha256 = "7e7858e1d3b2a1c47ee9863065a5dab7fe3b4649c90236607892ff3dd36ec565",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.3.0/simProTalonFX-26.3.0-linuxarm64.zip",
        sha256 = "90d105d65760f178ba81642f61d0998731bb41078aabbff3c5c39f7be3b2c3d2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.3.0/simProTalonFX-26.3.0-osxuniversal.zip",
        sha256 = "f7b2e739f73fb7572a29ac9e7d78a30215050f85b8492e6a95d2fae47a95b9d5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.3.0/simProTalonFXS-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.3.0/simProTalonFXS-26.3.0-windowsx86-64.zip",
        sha256 = "cf1492e8b155253e34fa53185e4cb1af045f635de5ff588dc6f14f53a2b9abe8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.3.0/simProTalonFXS-26.3.0-linuxx86-64.zip",
        sha256 = "f36bc886b8b7a0cbbdd87777ab07a6dcd817d58e3bab1f69b55d4d360d3207c0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.3.0/simProTalonFXS-26.3.0-linuxarm64.zip",
        sha256 = "497581a7d2dd1b617bd91a0f506a328ae2a17519d832b91ea84fba27c0c30b13",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.3.0/simProTalonFXS-26.3.0-osxuniversal.zip",
        sha256 = "470356dd461d882ac71cb6eba3cd72b4193776fce0539ec12f7d93b9d8a146ab",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.3.0/simTalonSRX-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.3.0/simTalonSRX-26.3.0-windowsx86-64.zip",
        sha256 = "e98d7ef7df69a0c25d137f033119e29a37724ee0e1dcd4bb62a7c53f94f23eb9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.3.0/simTalonSRX-26.3.0-linuxx86-64.zip",
        sha256 = "48662d8e033e72c7c1ac2cf9746d6efd0901f107e1c3f065a8359dd38148013d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.3.0/simTalonSRX-26.3.0-linuxarm64.zip",
        sha256 = "ff0e0fb8a771f00919ae86e904c0ec130e762d6a5fecea717877a8cee7b7bcdd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.3.0/simTalonSRX-26.3.0-osxuniversal.zip",
        sha256 = "9f94a5a22edd29be971849ba33166d65f59371fe4f824888e5805bf10c3e8e83",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.3.0/simVictorSPX-26.3.0-headers.zip",
        sha256 = "145ca6722246148cb30730ea059a26d284d522976b986ea45430f290ad994d4d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.3.0/simVictorSPX-26.3.0-windowsx86-64.zip",
        sha256 = "c4359a2a7d046e0fc7c5d856667706c51dea5a4f614698df9732c1e6f03243a5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.3.0/simVictorSPX-26.3.0-linuxx86-64.zip",
        sha256 = "7ca292a0bc3dcb2a65533c1dbb2214dea2e13f079a093b171d4bd64d021bbc43",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.3.0/simVictorSPX-26.3.0-linuxarm64.zip",
        sha256 = "c232cd2f4ed77e195448ca0347ef0e813686f6f442d73633c5b85edf472e46e9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.3.0/simVictorSPX-26.3.0-osxuniversal.zip",
        sha256 = "25ca6381727de70a7e337c7653d62abbff5f987703f9cdd3c4352bee02db4717",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.3.0/tools-26.3.0-headers.zip",
        sha256 = "523b26141e82b7ace373e1a7a6d4438bc080eb79c5e600edf4bf30c458a7fe9d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.3.0/tools-26.3.0-windowsx86-64.zip",
        sha256 = "d97604ac432b002cf95531c79facaaca6144b22f956cd968c4470617414f7308",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.3.0/tools-26.3.0-linuxx86-64.zip",
        sha256 = "0e32c58a8558a0bc258d0f16c5d9c26391129495eb94edaeb7e38e3fb1dcb415",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.3.0/tools-26.3.0-linuxarm64.zip",
        sha256 = "5d38883c39eb158356a7a9f27948f1c3847f4561854313f68755f6f48091d703",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.3.0/tools-26.3.0-linuxathena.zip",
        sha256 = "e740d965ee3e3cfbb5a25f7148de4fe7baf1c6f2369dac8eb22e80350cdffb52",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.3.0/tools-sim-26.3.0-headers.zip",
        sha256 = "523b26141e82b7ace373e1a7a6d4438bc080eb79c5e600edf4bf30c458a7fe9d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.3.0/tools-sim-26.3.0-windowsx86-64.zip",
        sha256 = "bf81dc53979dab69ccdb8fb1ca10b89ebf0c477f6d6ab6b062a757067f246786",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.3.0/tools-sim-26.3.0-linuxx86-64.zip",
        sha256 = "87ec29800db719d8137f57ccad8b4cc2ea5ec268252116874c4d824d77ad5239",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.3.0/tools-sim-26.3.0-linuxarm64.zip",
        sha256 = "a0f8ce738ab46a2694e37bafa09bee3c37408c4c3428c9eca71a2b2b61d0e5f0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.3.0/tools-sim-26.3.0-osxuniversal.zip",
        sha256 = "897127708056d8920ed48bd56ff7725a1c774f9b4f258b4d0b554b4ab6933e06",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.3.0/wpiapi-cpp-26.3.0-headers.zip",
        sha256 = "f55507e65329066425d2ade4f56325a320a8b02758952f7553a7889480886b28",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.3.0/wpiapi-cpp-26.3.0-windowsx86-64.zip",
        sha256 = "7fb81bf650ebb71465ba6bf518db349ae4c0224d12663a6e288f3dc195def90c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.3.0/wpiapi-cpp-26.3.0-linuxx86-64.zip",
        sha256 = "c102eb1e70f93a3b00c5d7fc8b4e60ac06ef707f80f3977e5414d41ed872dee6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.3.0/wpiapi-cpp-26.3.0-linuxarm64.zip",
        sha256 = "2cc15d8a77465c3ce61b24e42ad068746edc03ac919e49b3d0803f267d53589a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.3.0/wpiapi-cpp-26.3.0-linuxathena.zip",
        sha256 = "d606581e7fd853e1b54f65cff9750046d24e53d6435796aa14d23758162a69d0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.3.0/wpiapi-cpp-sim-26.3.0-headers.zip",
        sha256 = "f55507e65329066425d2ade4f56325a320a8b02758952f7553a7889480886b28",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.3.0/wpiapi-cpp-sim-26.3.0-windowsx86-64.zip",
        sha256 = "cdf511c2e7f215b7c5e3c0408f23d533d418da473a1a00dc59ec5cd29b6da68b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.3.0/wpiapi-cpp-sim-26.3.0-linuxx86-64.zip",
        sha256 = "a5d70f2a408328236a48639e65c4d0fd70238537715f9d048a17ced299e6287f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.3.0/wpiapi-cpp-sim-26.3.0-linuxarm64.zip",
        sha256 = "f7280fb6e4b0da631ef733421bd1fc5a49320ec33a37cf0b2044155815d408d3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.3.0/wpiapi-cpp-sim-26.3.0-osxuniversal.zip",
        sha256 = "e7dedd26744fc27224495272a59e933a724397a12d99e436bdc75001ce766b71",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.3.0/api-cpp-26.3.0-windowsx86-64.zip",
        sha256 = "e256e993c42963af22b5004e6dc1034d966c839e77eace4ff669a5f409f66576",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.3.0/api-cpp-26.3.0-linuxx86-64.zip",
        sha256 = "1077fe4c20659303fcea5609932d52a2a75e3b8fcfcca4a292a7e5dac1baf115",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.3.0/api-cpp-26.3.0-linuxarm64.zip",
        sha256 = "bf94636d3ee259242e4283049e29c993a5c9be194f134b11c7ec4f8474201c84",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.3.0/api-cpp-26.3.0-linuxathena.zip",
        sha256 = "d8c7dbcd5b5c4f79f563fa324f84f4bb665e8432d4b3310d5eab9e9e2e4372a6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.3.0/api-cpp-sim-26.3.0-windowsx86-64.zip",
        sha256 = "c968415381de5f205b025de5175f35a3a9dc36053d22b748ac18088bb79ce83c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.3.0/api-cpp-sim-26.3.0-linuxx86-64.zip",
        sha256 = "267472ab0589071b71f670d2de7a4143e2d2f1e71e50e5e90b883c2426f0becb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.3.0/api-cpp-sim-26.3.0-linuxarm64.zip",
        sha256 = "300348713a10838679ada58ad1c5f3dfcf7338c7527f2e789bc07757577a38c5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.3.0/api-cpp-sim-26.3.0-osxuniversal.zip",
        sha256 = "d0ed93a27d36e50abcb10ad3ca97a4e0d4f08eebe517ad1ffb39449cda486d45",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

deps = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
