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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.1/simPigeonIMU-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.1/simPigeonIMU-26.1.1-windowsx86-64.zip",
        sha256 = "faf1f6f5d05022ff53d36a4b78df54c25cc627fb113180ace43e8a8522e49a5c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.1/simPigeonIMU-26.1.1-linuxx86-64.zip",
        sha256 = "468216bd6ea4deed0301bccc83b3bc098d80770f357bb9bd588fedb291347612",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.1/simPigeonIMU-26.1.1-linuxarm64.zip",
        sha256 = "6a917c8c6d2492725f32d52cc3e0b8b9e78fe9acc1a978f817264547517ab6a4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.1/simPigeonIMU-26.1.1-osxuniversal.zip",
        sha256 = "61ec64323bddf15eaa3e6fddc753b912882d97d9dedafb7f45f4f40ec708c0ad",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.1/simProCANcoder-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.1/simProCANcoder-26.1.1-windowsx86-64.zip",
        sha256 = "ab82e0b03e7c709bba7b6b79101912c248683268ad20e50b23afade167da560d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.1/simProCANcoder-26.1.1-linuxx86-64.zip",
        sha256 = "bbd7745a61a8cad8c955c5a6b089bc226bd3142baf6e5b03c0687780e5c14398",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.1/simProCANcoder-26.1.1-linuxarm64.zip",
        sha256 = "aac6fd5edda4f9429a494c23c0bdd04af100480d943a4b5d392982f0cfc0e090",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.1/simProCANcoder-26.1.1-osxuniversal.zip",
        sha256 = "edc23f09a0d44ecd9f1ba0286e9ee01adb0f6f6d4cdf6beed22119c0e1cfc861",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.1/simProCANdi-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.1/simProCANdi-26.1.1-windowsx86-64.zip",
        sha256 = "1c6c5d63f6be97b60c824c5332aecadd76d99f4c0c3f93dba56ca440c35e424b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.1/simProCANdi-26.1.1-linuxx86-64.zip",
        sha256 = "d8bc580120f08d28865232a4eaecf8959dc8c842ee17658a4234548be351d32b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.1/simProCANdi-26.1.1-linuxarm64.zip",
        sha256 = "524f1de5efea54ece4db19265e52a05e3862431013e3aa5269655428e077266c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.1/simProCANdi-26.1.1-osxuniversal.zip",
        sha256 = "fee538b1d1b2a9bd7c3249b7f1ff20a611a5036138429524436ccb88a1333214",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.1/simProCANdle-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.1/simProCANdle-26.1.1-windowsx86-64.zip",
        sha256 = "b6c441a5b1c176e78e938724b26096ff907f7c832a9c93f7bf84379ebffd1b60",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.1/simProCANdle-26.1.1-linuxx86-64.zip",
        sha256 = "433cd92f1a927ff4035a46a7a23da7620bef0e9ea43bf1196c604ada886db4d4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.1/simProCANdle-26.1.1-linuxarm64.zip",
        sha256 = "c8066d68eaf979c3b7e3d4eeb5f97b4aee979e0fc9f35f7ff3eb8a8c6bf42d9d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.1/simProCANdle-26.1.1-osxuniversal.zip",
        sha256 = "b7f3ab3475a6948f41b147601aa6f5fc191e3f3db7d7f9f93128294ce636f724",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_SimProCANdle.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.1/simProCANrange-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.1/simProCANrange-26.1.1-windowsx86-64.zip",
        sha256 = "add6a3aa8734c43c6b8ededa617399696e2cf938f0d4fd43dfbaa1dc1eebbfcc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.1/simProCANrange-26.1.1-linuxx86-64.zip",
        sha256 = "97a495b3a342afae2f0e5e974237561e6f85e048fa4b481d6efcf3ed130544cc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.1/simProCANrange-26.1.1-linuxarm64.zip",
        sha256 = "120243e9f8049a110fbfec1c13bb549cd19106193b4d572000f11d1ce4c1ba63",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.1/simProCANrange-26.1.1-osxuniversal.zip",
        sha256 = "bd9af583086c5031ef6e0e1d36e10d8319ec65fdf5fe649e4d6f18387b0c6168",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.1/simProPigeon2-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.1/simProPigeon2-26.1.1-windowsx86-64.zip",
        sha256 = "c821a59809583b6afe02083b8c538e4d9bde8722356d9e4a11960431362cc997",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.1/simProPigeon2-26.1.1-linuxx86-64.zip",
        sha256 = "1a17aea35d6984d0d5b4bd9c635b8591af522190e6f334e5da0f30785afe0984",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.1/simProPigeon2-26.1.1-linuxarm64.zip",
        sha256 = "03ce17baecdf6bc88919d6678f1f9be1184764b195d2e43c151fb7fafbe50edd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.1/simProPigeon2-26.1.1-osxuniversal.zip",
        sha256 = "f79e3e378b574c4a35c4f04df18f3c5131ef27d3e062a5753de89fa8358ea8aa",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.1/simProTalonFX-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.1/simProTalonFX-26.1.1-windowsx86-64.zip",
        sha256 = "bf27ed18d7107980534f0a11e46eb33ff699f5de2644d8b5f652895d88f157af",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.1/simProTalonFX-26.1.1-linuxx86-64.zip",
        sha256 = "5010ed1a238d25fa896d07f6de2ad614a7b5300f8ae664b5910049c89721fde3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.1/simProTalonFX-26.1.1-linuxarm64.zip",
        sha256 = "530389124943b1980ffbd067da15dd7a28424fed380e68fb087eb0c9c958e30d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.1/simProTalonFX-26.1.1-osxuniversal.zip",
        sha256 = "a73f926495accaa91d44061222b97bd5a801d287b61460b0a806b791567ff184",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.1/simProTalonFXS-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.1/simProTalonFXS-26.1.1-windowsx86-64.zip",
        sha256 = "6b2501eeace5bdd03d05b36b437c98f4246ab3baab40e6d504cf1e39657ccead",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.1/simProTalonFXS-26.1.1-linuxx86-64.zip",
        sha256 = "18255aabdad688cdf22c34d8e83c4506fae87fd69429114e12e46e872a293f7a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.1/simProTalonFXS-26.1.1-linuxarm64.zip",
        sha256 = "8717d425b310a5e4501fddceaab6d69dc16428613dd6c5e9b779efdc77f0ffa6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.1/simProTalonFXS-26.1.1-osxuniversal.zip",
        sha256 = "00ad1940c70e46c36114c6b69e1ec9b3eef84a8f46b67f2c708233993b380f17",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.1/simTalonSRX-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.1/simTalonSRX-26.1.1-windowsx86-64.zip",
        sha256 = "7dcf8da14629a77e8f9c5beb5a696244c42997d709a1e51f29d0c0b55fd56b2d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.1/simTalonSRX-26.1.1-linuxx86-64.zip",
        sha256 = "5399fe0a0530405166683da7536aa69315113e9ec1ba1672f0f608c7ed8ed387",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.1/simTalonSRX-26.1.1-linuxarm64.zip",
        sha256 = "336445926d02fc629f5aa4f05ab13298ec5175430dc0729093441069a4cacfb0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.1/simTalonSRX-26.1.1-osxuniversal.zip",
        sha256 = "22c070766c2cb3642fb90c2e78da9b130ec49a406dbc9e02f60b0db7f6fd1009",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.1/simVictorSPX-26.1.1-headers.zip",
        sha256 = "2d880cb814ea3443cb31819100ca58efb878652214847c37c41f32d84dfed7ae",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.1/simVictorSPX-26.1.1-windowsx86-64.zip",
        sha256 = "728544e370af768e94519aaf4eeff24e2441255cc6b63c8775b7a756ee1405d6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.1/simVictorSPX-26.1.1-linuxx86-64.zip",
        sha256 = "e194349d67d20cc8e02320e1a69017048f16e532acd25c564cd4384f090bd560",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.1/simVictorSPX-26.1.1-linuxarm64.zip",
        sha256 = "feca1c8e40f5acd8a0b825b9dd7aed7642d4189d4370bc703120a52be842f0e3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.1/simVictorSPX-26.1.1-osxuniversal.zip",
        sha256 = "998a79229c13048529b1e3aae3cd5388b353379f08b143edf4e424fd76a5ec70",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.1/tools-26.1.1-headers.zip",
        sha256 = "69ea81e9fe3eee980ae9fa8a5dbb471eeefcb3094b69fd0efa0df3a8ae50a93f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.1/tools-26.1.1-windowsx86-64.zip",
        sha256 = "73154e323fe15ad41a801f3496ecd2f3f07a0a7730bbe35a440133a967039ede",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.1/tools-26.1.1-linuxx86-64.zip",
        sha256 = "ade8fb82c6ee1251e92e57e2cdf7ba6523f461fc29cca6b34bb9fcc305b61e53",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.1/tools-26.1.1-linuxarm64.zip",
        sha256 = "8c1555be2c3a6cac05517b62f32517b1d5e2f9aee06220caf2f319cd062de23b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.1/tools-26.1.1-linuxathena.zip",
        sha256 = "6ff56e1733a1ee921af85b685ecf62de2c449934bbe5c99e3dd87a013550ed4f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.1/tools-sim-26.1.1-headers.zip",
        sha256 = "69ea81e9fe3eee980ae9fa8a5dbb471eeefcb3094b69fd0efa0df3a8ae50a93f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.1/tools-sim-26.1.1-windowsx86-64.zip",
        sha256 = "92443f9745ade7d37d7bff735b1cabb1ef24ffd0bba6851b552c947a2dd25fed",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.1/tools-sim-26.1.1-linuxx86-64.zip",
        sha256 = "fb09fa1388bd62becfb3eefa3c96e73cb27eed2b5081c9c2660c641314a9ae71",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.1/tools-sim-26.1.1-linuxarm64.zip",
        sha256 = "e3a8724ede40f83df95fb840073a1111385a3acb23baad88adad01e34acec44a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.1/tools-sim-26.1.1-osxuniversal.zip",
        sha256 = "7f44134fabb84faf9e896cb632de8f38b7050f32fe11711ccacd5a211f6c5e0d",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.1/wpiapi-cpp-26.1.1-headers.zip",
        sha256 = "44fbdf3c541b4c231c1e56cac2cd499f181aaeeb48472329dd1fb85417a28908",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.1/wpiapi-cpp-26.1.1-windowsx86-64.zip",
        sha256 = "77a056cf37f644d3a9ced209549d09d14c5ed5b413420aedddc1d51df40bfe32",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.1/wpiapi-cpp-26.1.1-linuxx86-64.zip",
        sha256 = "eaf8c1e2c5d8472e6ee8c264b7003274c1eba4cd84e48bddca4289a5238d8398",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.1/wpiapi-cpp-26.1.1-linuxarm64.zip",
        sha256 = "d68d5cda85cffd1e892ffdc0deb9693b48dbb428c18cb631e6370d9ec2f231c7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.1/wpiapi-cpp-26.1.1-linuxathena.zip",
        sha256 = "286f035fa4c68f87e609efe579748b1da716a4a221320a645f28266ce30618b7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.1/wpiapi-cpp-sim-26.1.1-headers.zip",
        sha256 = "44fbdf3c541b4c231c1e56cac2cd499f181aaeeb48472329dd1fb85417a28908",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.1/wpiapi-cpp-sim-26.1.1-windowsx86-64.zip",
        sha256 = "1b2ecbea6727211d1f321ed61fb15640a9f0eeaa65afbf172f773cab7f6f03fd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.1/wpiapi-cpp-sim-26.1.1-linuxx86-64.zip",
        sha256 = "e17a98a6b2b7270821542a579ac01135fbdd6a65778f640b65534fdea7708c3f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.1/wpiapi-cpp-sim-26.1.1-linuxarm64.zip",
        sha256 = "245e3b306a1eec85ae089aec9c92e8bb4f0a2217b1ab9517813c94a8d82fc41b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.1/wpiapi-cpp-sim-26.1.1-osxuniversal.zip",
        sha256 = "a4023496c37c7e7498efacd39c9ec71441f3fd514e0d70052a2349414d7757d8",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.1/api-cpp-26.1.1-windowsx86-64.zip",
        sha256 = "4acac142e6675d5683796a26d87f5e0d618018e02437c9c3261d29f4606fc4e2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.1/api-cpp-26.1.1-linuxx86-64.zip",
        sha256 = "9869db15426791f45009fe8eb3bb10e2e71f05b468e1ffa81881ee05c52be468",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.1/api-cpp-26.1.1-linuxarm64.zip",
        sha256 = "2293bd3b99710fb5977417b183ae5a169831f84a62dc46e7243c9624981b075b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.1/api-cpp-26.1.1-linuxathena.zip",
        sha256 = "5cc3d28e2eedc17cbcd4e57bee2c41354c654a0b841592495efcd5e3469d2f3b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.1/api-cpp-sim-26.1.1-windowsx86-64.zip",
        sha256 = "42970f016b46ef2c0ee0716f0a24b006839a0095ad78bee29f7ccee5ff597058",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.1/api-cpp-sim-26.1.1-linuxx86-64.zip",
        sha256 = "23b8230ccfa9f078892de2a73b30a891993fcf0a878bb1ac51cd96141aa99e51",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.1/api-cpp-sim-26.1.1-linuxarm64.zip",
        sha256 = "273c3cf8ac1d70b0c024fd0bc61878147e0435a6acb355852509aba489e08bbf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.1/api-cpp-sim-26.1.1-osxuniversal.zip",
        sha256 = "7c9c6c7919722d387b0cd9624c64ab79bbe96ef106b421ebddd4e00d8efc8bed",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
