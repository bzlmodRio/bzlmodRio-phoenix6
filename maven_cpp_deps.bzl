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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.0.0-beta-1/simPigeonIMU-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.0.0-beta-1/simPigeonIMU-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "4837bc29efa9790bc125b21a40b779c98c83baf7c48309ee4583ae44512db197",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.0.0-beta-1/simPigeonIMU-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "47d1de04975b63522f63ad71d06e52118dab4b81cc4cbeb030369b4899903e2d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.0.0-beta-1/simPigeonIMU-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "8dce03bc96b87b70cb0407313deedb3ae8d5260db6fc8bda3c610a61c877d48f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.0.0-beta-1/simPigeonIMU-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "fa4d18373763087698aa361462c542339f2dfb8bddf518e867f45e450251caa8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.0.0-beta-1/simProCANcoder-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.0.0-beta-1/simProCANcoder-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "9394732257b4809e329a99bcfb322d880d17679f35daaa856fc5b98446d71cb2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.0.0-beta-1/simProCANcoder-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "87b19152a22c05b5bf6a24dce1c140719d1bb5c1534dc25429a553af9ea136a7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.0.0-beta-1/simProCANcoder-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "a99ab66e9dacf8ce9f80d9162f861eb76b1106c2b4663530b2d04844d2e830e5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.0.0-beta-1/simProCANcoder-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "88d7a92ff3e26a38ce68e21a1894db275776e046e4cc59e69c6b4af550b6bce0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.0.0-beta-1/simProCANdi-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.0.0-beta-1/simProCANdi-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "34e8077a4fa34e26456bbc616c1a90b5383d35aa5f2e540e155f2b6b694efbd3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.0.0-beta-1/simProCANdi-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "3441ebaffd5c489e2275c812ae8f0658fbf8f2ce7d2f5f0d96d08449df35ec99",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.0.0-beta-1/simProCANdi-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "01bc5759cc6e16ddfd4a5774477d8f79513722ee92deced4a7e42a6e5c06d04c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.0.0-beta-1/simProCANdi-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "00035d2eec51c82c94bba8dd90b7c861a1c6789ccc4123ac0a573b604d88d5a3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.0.0-beta-1/simProCANdle-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.0.0-beta-1/simProCANdle-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "07752b78f7ed149df1a0e30ddb5978ad4138f071418be1598b0a4c4facf23deb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.0.0-beta-1/simProCANdle-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "b0af68192650b3c707a5b7e67c82deeafd51d67211c777e840b3e19affb71c01",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.0.0-beta-1/simProCANdle-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "b08b1c1522ae4c334e5234d5e18997e18b6e4d8902c2ca1f3da4a753a6724a6d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.0.0-beta-1/simProCANdle-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "608d7bf429e2aec2796f8339d115f626cfdc063c3dd37851c5fa6d1c1e6e393e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_SimProCANdle.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.0.0-beta-1/simProCANrange-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.0.0-beta-1/simProCANrange-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "09cd304f19d2778a2e9713dfb14747d9f805ab172d4374bdc7cd94ad73520b8b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.0.0-beta-1/simProCANrange-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "e1d097efa78274a976975bc2b8717b59d01c14cdf39c0b629ebb7a4f9313b429",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.0.0-beta-1/simProCANrange-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "ff60ea49f9f623aa15f588c1e85053962fbf595885907cb4a1d5430b28318e0c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.0.0-beta-1/simProCANrange-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "2cc58b6461268cef3030a4e88480fae2e524092231ef7ec670f50891c779aaed",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.0.0-beta-1/simProPigeon2-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.0.0-beta-1/simProPigeon2-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "d462c2b80635d0bbd7d7fb3752e62a32ba8abfa382712bfda9e7c6b94fecaafc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.0.0-beta-1/simProPigeon2-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "7b6e5ef1200803ba663a915787f162440f052193b2156bcd36d822f0fa4b1022",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.0.0-beta-1/simProPigeon2-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "8ff9259be96b1be064d5449fa4cae35cec9d6c5958ffc1d453b642e12269fe0f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.0.0-beta-1/simProPigeon2-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "22c5a57a1d26f30bd3f93a62a0836755b1c3fca645ee1e55ff50f90e9d184ddf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.0.0-beta-1/simProTalonFX-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.0.0-beta-1/simProTalonFX-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "024cdb3496ae1e6f18e7a2260729cdf22c6b18a45940a150d2ba57bf787ae745",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.0.0-beta-1/simProTalonFX-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "4d11d86e072254952692c36a33d1d064487db977572749552b5332982eb298f1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.0.0-beta-1/simProTalonFX-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "8de0fa4693c71c3c692171e0cc8f922abe12fbb76d849de52b3bed7478e43120",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.0.0-beta-1/simProTalonFX-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "500519a997864dfa429878096c6c9ec06ee3db79b96e3c11399d4c66a85bd0bc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.0.0-beta-1/simProTalonFXS-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.0.0-beta-1/simProTalonFXS-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "a338b06dd41060ff59d40455989177ae740744a2b72a8dceb572c58ef9df94c8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.0.0-beta-1/simProTalonFXS-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "658be77e1b220d28354edf90381088bd20d77dbe8eea63d94193ed62cb06d133",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.0.0-beta-1/simProTalonFXS-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "d50aa9e2d58d2eef2862ddbb45ef7863482c325418caab703670b2ed05d7e42c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.0.0-beta-1/simProTalonFXS-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "b8a6ef893ab21364c7fc46be01ac73a94f9511cc05af8be00a78c9896e0f442e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.0.0-beta-1/simTalonSRX-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.0.0-beta-1/simTalonSRX-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "33b4e0977f7d975ffa3ba39eec20c04e23a3258bec8258af783e5b5102b7f717",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.0.0-beta-1/simTalonSRX-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "3cb8f324f0e5a675f2d779dc99142bb5f252b63af06798c642b1efd29bec102e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.0.0-beta-1/simTalonSRX-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "9f6948b7f952b8d10df9e6fc18448f6265fb151f7febf4d504be6f9d71657d3d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.0.0-beta-1/simTalonSRX-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "5794d82737e952ba12ae973dd1d3c573f664100240e4cd658e726e7debb72205",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.0.0-beta-1/simVictorSPX-26.0.0-beta-1-headers.zip",
        sha256 = "018a2a1a84974f6a8af74b6ec38ff2aa51880696401f2663549622ed4ae11102",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.0.0-beta-1/simVictorSPX-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "0fc8f8cac06ec2edd6758f8d793f8f030e4b55c8a37052191cd763daf153d619",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.0.0-beta-1/simVictorSPX-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "efd6b50fe796558dab314fe63cee847b32a0babd22ab6a02e396037bd0bee4e2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.0.0-beta-1/simVictorSPX-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "292cecd2e90cf01f1344791457a0992030832f9281b52b65bb40e9bd996162fd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.0.0-beta-1/simVictorSPX-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "008a3351158f85be87bcfa6a4682fd54f6a4689710f7732d8055c72108c1d28d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.0.0-beta-1/tools-26.0.0-beta-1-headers.zip",
        sha256 = "0d08e268d7324cb0e7b68e8058c74b7a8bd8cd9c0e328adfc7b1fc0030df8dc2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.0.0-beta-1/tools-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "e0080c924c15b2637069e1e6abbf33c4811b01ba9f80ff8b2d1eefb877dcf026",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.0.0-beta-1/tools-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "4fada5c5ae827739cc3b0a81cd0c9fd89a25ef8135fa5ada34caf57f40ae9993",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.0.0-beta-1/tools-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "b419ec6b2aa2595ec2fea93b0bce3e965e5c9059575bfdce25e47a31c2d27059",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.0.0-beta-1/tools-26.0.0-beta-1-linuxathena.zip",
        sha256 = "35e76fd7d380265e08e5e391e33bc216bdf701976497616fc4f4d034e7be16fc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.0.0-beta-1/tools-sim-26.0.0-beta-1-headers.zip",
        sha256 = "0d08e268d7324cb0e7b68e8058c74b7a8bd8cd9c0e328adfc7b1fc0030df8dc2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.0.0-beta-1/tools-sim-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "ce2ed001ac6a35b71dc98076c696fb7216ea40931bb4ea08c1259b78b6d551fe",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.0.0-beta-1/tools-sim-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "7c6524b980e9adc12edd3e27e6d20c696231b72f7bd3c5e699d479cba991f9eb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.0.0-beta-1/tools-sim-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "ea24f706f9ffefd7de49b2cca5a943dbdd16b1e081c9908bab659c6dff5026ea",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.0.0-beta-1/tools-sim-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "bb05387c300bf3a07e582bfcbd198e9e8e2f79926d4466c856c575d7f90dd2a8",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.0.0-beta-1/wpiapi-cpp-26.0.0-beta-1-headers.zip",
        sha256 = "6488d5c68d52e326010164f9141071f2e77c47802a1b40e7cdb95869b96d9653",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.0.0-beta-1/wpiapi-cpp-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "21754cfc1df9861a73406c0fbdcbf330e48f261db4a86fb979d7e10aea634f75",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.0.0-beta-1/wpiapi-cpp-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "6b272d140bb4cbbced8a81d58853e7aa41f410bf94087455c6473e72f923eafe",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.0.0-beta-1/wpiapi-cpp-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "27bf5f8b27ad31b5410658d54169b1252cd7abd49bd7d916179342624d287004",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.0.0-beta-1/wpiapi-cpp-26.0.0-beta-1-linuxathena.zip",
        sha256 = "93d6f04c332172f1b6ce4a91fc340745a264f61b02795cc1a47cee6b20c153c5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.0.0-beta-1/wpiapi-cpp-sim-26.0.0-beta-1-headers.zip",
        sha256 = "6488d5c68d52e326010164f9141071f2e77c47802a1b40e7cdb95869b96d9653",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.0.0-beta-1/wpiapi-cpp-sim-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "0d8adada2cd5b725e285c569cb8bc10d3247caf3d876ec5a895cdaa5001f4b39",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.0.0-beta-1/wpiapi-cpp-sim-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "3b3822b671bfe58fb7028f7411f36f43880ad6122ee11b05288da0a43177aeb3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.0.0-beta-1/wpiapi-cpp-sim-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "590cbd0221f28ab81aebafca700f656743ae07583ece9119e9aee31815289f11",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.0.0-beta-1/wpiapi-cpp-sim-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "ede13df6178873cd632e4c00e2b60ef5fd1ce7649f29ce5f856bdf0ecbcce41d",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.0.0-beta-1/api-cpp-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "a62edd4a10ae6b642332e141ae23e9f10bfbefe5de91c21d10136fbed8c1464d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.0.0-beta-1/api-cpp-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "d9f0b23b1fdd37d6a6370db5c83d66b833b4a031d110c8f29a594ab38f53f272",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.0.0-beta-1/api-cpp-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "07fbb2ec427c2731d289c791af83a0ff8321538f1058e4e95a7574eff6cc2658",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.0.0-beta-1/api-cpp-26.0.0-beta-1-linuxathena.zip",
        sha256 = "c731496ddddd727b2e829934d79f19b05dd1d6745903b5d394c5832440171649",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.0.0-beta-1/api-cpp-sim-26.0.0-beta-1-windowsx86-64.zip",
        sha256 = "f125763371e1e14b03d1ccb08225feca1e90385f7530a5f7a19cbe877ec3ae0b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.0.0-beta-1/api-cpp-sim-26.0.0-beta-1-linuxx86-64.zip",
        sha256 = "1f298a5455412d95ec56d3870737773d132e38f6bf4293c90de7240d0c41677f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.0.0-beta-1/api-cpp-sim-26.0.0-beta-1-linuxarm64.zip",
        sha256 = "0b757645b38454145c5ba006332caf852c03e4812f7af68454095c02c1aa12f5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.0.0-beta-1/api-cpp-sim-26.0.0-beta-1-osxuniversal.zip",
        sha256 = "257e1bd56acac165af2863dc09a6b332a947abfed121fc33f742fa2f4ed3ef47",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
