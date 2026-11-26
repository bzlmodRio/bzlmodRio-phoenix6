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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.70.0-alpha-2/simPigeonIMU-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.70.0-alpha-2/simPigeonIMU-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "eeed1d075a64c2ae9ec2fa5febd74386d40952f9f393ddb6c3db6907e9f7ed54",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.70.0-alpha-2/simPigeonIMU-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "660742ef45c55fbd837d4b9b8729f183000fcda1f98687c41ccb1b8ab1aa4b07",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.70.0-alpha-2/simPigeonIMU-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "5dc4ce5489d68fc4a994b4579f1fde0de80b856e0bc50a2c21ec378c45a28c22",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.70.0-alpha-2/simPigeonIMU-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "92404d16bc48da976a0d86e960ab45b1bd7c4b60b119ac04b0ab91ced4d3dd93",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.70.0-alpha-2/simProCANcoder-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.70.0-alpha-2/simProCANcoder-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "68f0863c765d081c23e037b9e0a0625326f2eebdbbd3a47199fab359ea61111e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.70.0-alpha-2/simProCANcoder-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "33e9542fbb05e29793bb98ab1262e46a7318d730cfe5b67c24d9f4bf841e9d83",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.70.0-alpha-2/simProCANcoder-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "3c4c09e32cb59cdec27295483b2b8d330359996f08bab06b4e3a9c199b64a077",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.70.0-alpha-2/simProCANcoder-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "e48757b8e24ffce14254bbaba0701450c71f83bcd163c954e580a4d19cdf17a4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.70.0-alpha-2/simProCANdi-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.70.0-alpha-2/simProCANdi-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "409e9b3ad1e03bbe5c070626d0ccd10c5ad1507f3bd2988aef789997b9f7093f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.70.0-alpha-2/simProCANdi-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "c02fe69b797ae068fee9066314a13ed07a360f6cb3602b6cf79e3e4d0a5d9765",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.70.0-alpha-2/simProCANdi-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "5094b363e882141485bd835cf9ffb53aeaa2fd2cb0f9e0a8df381d521e96d2f5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.70.0-alpha-2/simProCANdi-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "8bd22d89027e59e79174d554d7416379ae00d1c15f91ab22b47fbacfdf340393",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.70.0-alpha-2/simProCANdle-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.70.0-alpha-2/simProCANdle-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "dbbdf9637603b3812d85350532332a5eb0e409d84faa910dfa6b70da1a5f49aa",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.70.0-alpha-2/simProCANdle-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "ebc64f0519526b950253e386506eb692afcef7fe4608f3c0c5832c14c957a86f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.70.0-alpha-2/simProCANdle-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "a16017d0d926ac67c50408d58febd281f2062160bdb4d774a1849d739fb2b8e2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.70.0-alpha-2/simProCANdle-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "144371bea107802c5d2d9ec26d889cb2cc1b2435324bdda6a1f95e54366aebf3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_SimProCANdle.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.70.0-alpha-2/simProCANrange-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.70.0-alpha-2/simProCANrange-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "9d7a5ea6a3abb22b1ce52085e22884bfeeef63a29d00756cf6e0c74a807fd1cf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.70.0-alpha-2/simProCANrange-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "83561486ac9ff2f038f4b9923b16af09e9553a85adddad869e9bd3b3335810a0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.70.0-alpha-2/simProCANrange-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "cf86d1dbcf9f5c46f87f290e0705afd59f3ce13b6efddd5215a482b978b9aa31",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.70.0-alpha-2/simProCANrange-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "c4b21c29101775ec2d66826adebbfa76a42411798b2cc92e52669022d8cdc61c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.70.0-alpha-2/simProPigeon2-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.70.0-alpha-2/simProPigeon2-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "9b84059383bb7b0b94d49c487f391b3788a26a62353fde6c266de275d8e2a868",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.70.0-alpha-2/simProPigeon2-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "faa009a2054c9aab5545c2e186d0e7fbee0bc226af5d8d12db730ffa07b52d87",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.70.0-alpha-2/simProPigeon2-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "53100dbced0f6fa7b066bf8329ed1166fe1697bc97a2b4c19d57d23e0a8dd343",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.70.0-alpha-2/simProPigeon2-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "975169e71410e626e5ac22d29f2c8b69b7d5920df74bcb0ea03970b33b186047",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.70.0-alpha-2/simProTalonFX-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.70.0-alpha-2/simProTalonFX-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "d21a6fb39952674dfd17f1f723edbb8578d9fe9f15246f70fc09f146ffb1904e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.70.0-alpha-2/simProTalonFX-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "a8afe92d56b1dd01c17fef7cdde34c38d3e20dc056d204f05dc205e9bcda1c08",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.70.0-alpha-2/simProTalonFX-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "edbdaacb2d7c2332290ea3961c9e1829b99b12558c866db7058f7ca6578b197a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.70.0-alpha-2/simProTalonFX-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "664408695c0cfc131b543e65db852c2878dc2f59df320077f20949e648621897",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.70.0-alpha-2/simProTalonFXS-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.70.0-alpha-2/simProTalonFXS-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "6354d258d7f95bb7f1869bd9e9f7b2823dfbcbe79e583e54a754bf218f1308ea",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.70.0-alpha-2/simProTalonFXS-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "9733c27d50529deeaaf3fedd88c64f8d706b0664b3177a629c78f64f5fce7f6c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.70.0-alpha-2/simProTalonFXS-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "ad5bfb089b2282ef45cc81e9c2485607e6576ececa57e2892830050eecfa6b7c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.70.0-alpha-2/simProTalonFXS-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "76d26e40e946e6cb20973415c4ff7782029179083294089421da869897f92a29",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.70.0-alpha-2/simTalonSRX-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.70.0-alpha-2/simTalonSRX-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "92798891f308a3656221783cb93f2263607e074ce6955a43524574123742afa8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.70.0-alpha-2/simTalonSRX-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "bd989c3d75ef62cc7fc290951763b79a59b5366883e9cb54b83a37015d67774d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.70.0-alpha-2/simTalonSRX-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "189e1965439918ff2cf790b2f2ab5cf94aad7ff1695fc5d05693f20b6fb72c17",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.70.0-alpha-2/simTalonSRX-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "d0ebb8c10810b030fc1ee276b562d27851f61c775216774da9a4bd2e11bd2006",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.70.0-alpha-2/simVictorSPX-26.70.0-alpha-2-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.70.0-alpha-2/simVictorSPX-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "4bd24974e761cb8171229d1eb53c3d4c0d7c16f7f21caddd4a750629b9ef632f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.70.0-alpha-2/simVictorSPX-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "707ef828cf385743682b8ea17e9abd70873ec0a1dc122a5ec82de6f876051a98",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.70.0-alpha-2/simVictorSPX-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "ee9cd4d4f65624c2154d47fd1109149678ea742af0a931195365d3d08a0c207a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.70.0-alpha-2/simVictorSPX-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "25c6cac6f64f8c042c62891c1b52a3d063627008f5fbbf439128c3fae360b287",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.70.0-alpha-2/tools-26.70.0-alpha-2-headers.zip",
        sha256 = "e746398fca3a71270c45ff0b3d147da2f187ff957fe8ff096c97d3dd0fe857c0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.70.0-alpha-2/tools-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "bf9c916c11da54c9de0c8fa385735c5f8fc4185a5199aa9f8b0dfc4ebef2dc66",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.70.0-alpha-2/tools-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "24924e6346f3bc6b9a0dd124047d65d40bdd54f85afb31f1a26351dae76b0438",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.70.0-alpha-2/tools-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "7bb1edb40c0b5752cf7b62b5a1abbc00f6d7f84d504145d04c6b912c49ad1fca",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxsystemcore",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.70.0-alpha-2/tools-26.70.0-alpha-2-linuxsystemcore.zip",
        sha256 = "94f47e069e88b6c478024c4fda179ea9b90ef490813bfcc3874be7bb9e96bd61",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.70.0-alpha-2/tools-sim-26.70.0-alpha-2-headers.zip",
        sha256 = "e746398fca3a71270c45ff0b3d147da2f187ff957fe8ff096c97d3dd0fe857c0",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.70.0-alpha-2/tools-sim-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "c511f7c08d2ae65c5783e93d4f2d6915a1d36356d0db975197cdd379f8b03f2a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.70.0-alpha-2/tools-sim-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "ffb495c8e238bf2293d1496c73db0cb139790d263ba190a1f57a4a4dd9ba60f2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.70.0-alpha-2/tools-sim-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "edf7cf01d448f0677027369311096725607a1b2b9fadff7f2c284c96bfac80e8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.70.0-alpha-2/tools-sim-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "ef3673591901bd8778906e542489573ba0ddeecba0b03055a5f614373faf89b1",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.70.0-alpha-2/wpiapi-cpp-26.70.0-alpha-2-headers.zip",
        sha256 = "94207cb16417a81470877b761ccbc27aeae008b9299884c17a48f32c047b3d4a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.70.0-alpha-2/wpiapi-cpp-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "0e58d2ccf3b774d4707e05ab0462ea44912b0ae647d0a6733a173976e0a1e641",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.70.0-alpha-2/wpiapi-cpp-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "b2f069e488cbac5e853d433fecf2dc3956b0cbe372db43878e146b2e9aab91b1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.70.0-alpha-2/wpiapi-cpp-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "516f007ad7eaa6edfda699ab543ad04416b1d8808a17849de16b1408ae9f5c9f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxsystemcore",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.70.0-alpha-2/wpiapi-cpp-26.70.0-alpha-2-linuxsystemcore.zip",
        sha256 = "8b7f59e7661b0dca815ed5fd0daa9d21d8c648809e1c0b4164cdfda355d2595d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.70.0-alpha-2/wpiapi-cpp-sim-26.70.0-alpha-2-headers.zip",
        sha256 = "94207cb16417a81470877b761ccbc27aeae008b9299884c17a48f32c047b3d4a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.70.0-alpha-2/wpiapi-cpp-sim-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "d8d3a90c85b3ea57f934f9547648a1475f9be3e7a6a0f060f82c72f436e42b63",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.70.0-alpha-2/wpiapi-cpp-sim-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "6cf62030b78c1cf1a56f74fb44e99f1e6ae35daa1b8fd791068429b1faa11f99",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.70.0-alpha-2/wpiapi-cpp-sim-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "c138b3758fb44baf2f8f2fca9355ac7dd38a29e050f69489988be9ed1b398187",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.70.0-alpha-2/wpiapi-cpp-sim-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "9781ef25a31fc5ad8d02a237fdb04e08972f512b09b12b3437667d2a15a85177",
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
            "install_name_tool -change libdatalog.dylib @rpath/libdatalog.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libdrivers.dylib @rpath/libdrivers.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libfields.dylib @rpath/libfields.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libntcore.dylib @rpath/libntcore.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libtelemetry.dylib @rpath/libtelemetry.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libtunables.dylib @rpath/libtunables.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.70.0-alpha-2/api-cpp-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "782e1b0c0b11cf30a834fb4c71aa5f0b48d5457cd6d6af5d4668f484cf3035e7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.70.0-alpha-2/api-cpp-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "979f2e4ea54eef038c4123cd58b005dff4617a0bed47ed1ebabb27f7189368fd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.70.0-alpha-2/api-cpp-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "101376b66005562c97ea76a45d2f6f671c98a165f67d52aab01e1aaa88d80a57",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxsystemcore",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.70.0-alpha-2/api-cpp-26.70.0-alpha-2-linuxsystemcore.zip",
        sha256 = "729bca8ffc3b36e6a40cb026cfd127de957a572eb40b833f36faed67ab1dfdd5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.70.0-alpha-2/api-cpp-sim-26.70.0-alpha-2-windowsx86-64.zip",
        sha256 = "cb44add13a02510ec2a3bac6cf50a7ac7316127a69349049505c4dc909c23b8b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.70.0-alpha-2/api-cpp-sim-26.70.0-alpha-2-linuxx86-64.zip",
        sha256 = "6df6b39fdb0bfd8e47db3dc084a02137a5ff85fe027076934d7c5c3ad03b3ae9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.70.0-alpha-2/api-cpp-sim-26.70.0-alpha-2-linuxarm64.zip",
        sha256 = "9b0578a59f473c91d530e6587b9ef44fe478e892c19ee86c1afb8d2a946ec233",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.70.0-alpha-2/api-cpp-sim-26.70.0-alpha-2-osxuniversal.zip",
        sha256 = "077e5f9979100e28371fac1c0a288e7be90c6dc291b9f37a722a5300cdb5d1f7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

deps = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
