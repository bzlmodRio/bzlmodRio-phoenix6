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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.3/simPigeonIMU-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.3/simPigeonIMU-26.1.3-windowsx86-64.zip",
        sha256 = "049cf56446195825180173682f6ba2209d69bfece7c07a3724fe1f1e3fa20f69",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.3/simPigeonIMU-26.1.3-linuxx86-64.zip",
        sha256 = "91fbd4a045c71e9a49ddcdf81fcdd7315977be501a8896f3f85fc3cf437c550b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.3/simPigeonIMU-26.1.3-linuxarm64.zip",
        sha256 = "53271839a03ff2d89bef6bf2b084d7c08bdb8ae89bbf7892d5a438a513ca1d42",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.1.3/simPigeonIMU-26.1.3-osxuniversal.zip",
        sha256 = "12f03ef1ea8e56540c75047dde14a164a5baeb157297b3f453f864e19b06ce27",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.3/simProCANcoder-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.3/simProCANcoder-26.1.3-windowsx86-64.zip",
        sha256 = "f412c1520a5c4092edf4e49b60771999f26288e522cb93113c39f4e5a174d921",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.3/simProCANcoder-26.1.3-linuxx86-64.zip",
        sha256 = "58bc02a0edafe09902a3ad684ede69c2ff63317dc2e3f5bead5206db71d21ee4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.3/simProCANcoder-26.1.3-linuxarm64.zip",
        sha256 = "4b82b0573662a1a8190142ca56345e566196e179afe70ea1ab3600734503bc6d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.1.3/simProCANcoder-26.1.3-osxuniversal.zip",
        sha256 = "ceac3dcf15d00d0a049bf95701bef58ad9096aea47add55937e181d4fb94ab10",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.3/simProCANdi-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.3/simProCANdi-26.1.3-windowsx86-64.zip",
        sha256 = "672d1b4b76a8b51f7f28d3cc0461157770b2f8f0a05dceaf6dbdd068ef5ff552",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.3/simProCANdi-26.1.3-linuxx86-64.zip",
        sha256 = "860aeec454c1a234d323fe87971813ee9ee375ecf7d820c5d3bb9edfc512f5b9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.3/simProCANdi-26.1.3-linuxarm64.zip",
        sha256 = "476663ab1b79e6142624dbebd81be9fcaf6b230dff0f954af7af7a191cc38ae5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.1.3/simProCANdi-26.1.3-osxuniversal.zip",
        sha256 = "e1b8817ac9cff2238850b8826d21e7b2060b8d2b27595a8492161e4acab569e9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.3/simProCANdle-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.3/simProCANdle-26.1.3-windowsx86-64.zip",
        sha256 = "a40b5e5fd57f7d29cc1783047905eb15df16531a60d97aa8d881db25bf50df3b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.3/simProCANdle-26.1.3-linuxx86-64.zip",
        sha256 = "1537c45d3b70e629910f7514438a9319ecdb9af2bb9e96e7b72cc774a5051ae1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.3/simProCANdle-26.1.3-linuxarm64.zip",
        sha256 = "0db7dcfd08ed476b0e24f0f1784716114841f5ffc82e7844f285cb42f80e02c3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.1.3/simProCANdle-26.1.3-osxuniversal.zip",
        sha256 = "02a5b4d3d74092d0a010b499241ae13d1a7f711444d82b874f40533cbb69e668",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_SimProCANdle.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.3/simProCANrange-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.3/simProCANrange-26.1.3-windowsx86-64.zip",
        sha256 = "0f6f05e28eea5e5fe272c898c82b59b098bdb502401515f061abd225a9b723e3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.3/simProCANrange-26.1.3-linuxx86-64.zip",
        sha256 = "4c79d6abc240ee576650f068b812e9b0e52e7e6f3fdde193aa39f081ec7041c7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.3/simProCANrange-26.1.3-linuxarm64.zip",
        sha256 = "04df1b97a086c00093da4e06eaf4e59a44990a0b38e3e9d026d801caec55cabc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.1.3/simProCANrange-26.1.3-osxuniversal.zip",
        sha256 = "ec3db8e7f9e7188bfed5dc4ab5231cb58e632f30b66114331bb6cc2561f9134f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.3/simProPigeon2-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.3/simProPigeon2-26.1.3-windowsx86-64.zip",
        sha256 = "6c1c17b9e150e079b7a05a479758f0d3b82f976d550b129234998550759e53a5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.3/simProPigeon2-26.1.3-linuxx86-64.zip",
        sha256 = "d920c1c29fa784ac7bd2856839b6933398c15cccc0d4a1a5653710013f9e841c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.3/simProPigeon2-26.1.3-linuxarm64.zip",
        sha256 = "96024af2faf9c8ce9b8e707695971c5b1387c64790315701cf228d511f09949e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.1.3/simProPigeon2-26.1.3-osxuniversal.zip",
        sha256 = "db12e38a9bbd035f42676d09ea660259ac6b8e4b77f96c0e45f6f6f768452fda",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.3/simProTalonFX-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.3/simProTalonFX-26.1.3-windowsx86-64.zip",
        sha256 = "23594e45433904de9b1b498be2edf75beed1d912a4dcccb0fbc08257dad80b3f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.3/simProTalonFX-26.1.3-linuxx86-64.zip",
        sha256 = "a4cbf8ce2e9ef48955b2e9f7d2ceeda16dff9251a891ac0c57f4212ff1b6ec23",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.3/simProTalonFX-26.1.3-linuxarm64.zip",
        sha256 = "c239f05ba4f236fce4b7747c19729f08b12b36126b18f65905bc40229f79ec79",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.1.3/simProTalonFX-26.1.3-osxuniversal.zip",
        sha256 = "b5cf4b6569daf2fec299641eaa70b6b686e7646bc924f3131423673ec5f45f22",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.3/simProTalonFXS-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.3/simProTalonFXS-26.1.3-windowsx86-64.zip",
        sha256 = "88d233b2762a88d686f99a1d0003245e309a267ca0b602bb1323eae57b7b2ae8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.3/simProTalonFXS-26.1.3-linuxx86-64.zip",
        sha256 = "a98493f2acfbdd57a2ac3edb2f1326817e17aa5e16eacdd980862845ccd48f4c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.3/simProTalonFXS-26.1.3-linuxarm64.zip",
        sha256 = "7a7299b78647749005da1ee210a31c25f22f631104ca7ef13027808eedabac7d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.1.3/simProTalonFXS-26.1.3-osxuniversal.zip",
        sha256 = "c63f239c86c70c9f627f21670d9a155abf1ac4cb96d9fef5282525d3bd63b113",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.3/simTalonSRX-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.3/simTalonSRX-26.1.3-windowsx86-64.zip",
        sha256 = "59912f64312bd518a3a42c03b675be209e4b1a843bde3a2c3265dfe3b8119883",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.3/simTalonSRX-26.1.3-linuxx86-64.zip",
        sha256 = "5d0e3aee46f93a148999fe5311a16712a325cde350c80903be29a481bd71065a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.3/simTalonSRX-26.1.3-linuxarm64.zip",
        sha256 = "f63d808a2ad1ba46588d056a3986f7455e2b71ac9bede4ff3ba52842dbfadcc3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.1.3/simTalonSRX-26.1.3-osxuniversal.zip",
        sha256 = "f514ddbaeb2022dabb0a09f4b0e41d45441eef4cc3d5f44da2922c75e6da371a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.3/simVictorSPX-26.1.3-headers.zip",
        sha256 = "1d85b5780684a888176ed8380a3c87e992580825910c2feadf6092ac544b5e68",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.3/simVictorSPX-26.1.3-windowsx86-64.zip",
        sha256 = "5d907864c762d7ca330c88f79789b84062ab8e756b6520256f31a2f9ae09361c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.3/simVictorSPX-26.1.3-linuxx86-64.zip",
        sha256 = "506da9920058aef95d5363b197625d6a076bb18e0fcb1d34cdfdb7ea3e45ec18",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.3/simVictorSPX-26.1.3-linuxarm64.zip",
        sha256 = "71d9912bbd2d6d45531a4c0194678722baeccc1add0fc86f2994731d7a1a80f3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.1.3/simVictorSPX-26.1.3-osxuniversal.zip",
        sha256 = "ec2c6a4be8f57e0d7ca3f8b34a234127381b2ac8829d9df687288f19cac78c60",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.3/tools-26.1.3-headers.zip",
        sha256 = "daa7ba1dd01780b0b68ce9dd0c2467f6a860b15df278917ebc018f150da9f020",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.3/tools-26.1.3-windowsx86-64.zip",
        sha256 = "9728ffdbb74639da36d4c7eef1ded89ec130e8b940b319e5a6b593c3562a7947",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.3/tools-26.1.3-linuxx86-64.zip",
        sha256 = "ccc4eec96c8ce772814fd9d6ef8ff89e7bf54d0db1b3c4593338501a2f85d2b0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.3/tools-26.1.3-linuxarm64.zip",
        sha256 = "2cd583c17453943ef85122738e9173788810a4853f6b2dcb4f057df5897f1218",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.1.3/tools-26.1.3-linuxathena.zip",
        sha256 = "37096f81877c33322c2e85a6a920dc526890ec9aa8be061a5f0d1945d306d55d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.3/tools-sim-26.1.3-headers.zip",
        sha256 = "daa7ba1dd01780b0b68ce9dd0c2467f6a860b15df278917ebc018f150da9f020",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.3/tools-sim-26.1.3-windowsx86-64.zip",
        sha256 = "8811e47ea8368393790feb0ccd4ae4da4e1ce38164c79768788db497468d374e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.3/tools-sim-26.1.3-linuxx86-64.zip",
        sha256 = "c5291ffe1d72cf3a65da60a1f0bf39c9abba6fbd6ea76fd12d0d7fb52c242872",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.3/tools-sim-26.1.3-linuxarm64.zip",
        sha256 = "70c6978c2bc5cc152c71b79a980c076d22bfb2d9150dee73afba9cf101231143",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.1.3/tools-sim-26.1.3-osxuniversal.zip",
        sha256 = "962c74b0533185eb99bba09a3885c1c0704ade5bb18a9b684a589857a58f3cc5",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.3/wpiapi-cpp-26.1.3-headers.zip",
        sha256 = "9ee1eb9b7671d0a629f4b1a3218baa736916ef2234ec4edba2c44a583db5e8fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.3/wpiapi-cpp-26.1.3-windowsx86-64.zip",
        sha256 = "c3cebcff3a5f2b80e71f7269f091108626dc60ea308440d4a23aa2f387024c11",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.3/wpiapi-cpp-26.1.3-linuxx86-64.zip",
        sha256 = "97f8852e752b10c504302d12cc7d7cce714bdadf17b71052fcdc370c41251976",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.3/wpiapi-cpp-26.1.3-linuxarm64.zip",
        sha256 = "94523ca6789a48aeba6c0f74efb0635b1cbb69f4de21e52373561c2a8ad2c59c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.1.3/wpiapi-cpp-26.1.3-linuxathena.zip",
        sha256 = "be8e91c79d71416253fca525ee3f09c48880c01fb21a9db696838b32b249a873",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.3/wpiapi-cpp-sim-26.1.3-headers.zip",
        sha256 = "9ee1eb9b7671d0a629f4b1a3218baa736916ef2234ec4edba2c44a583db5e8fc",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.3/wpiapi-cpp-sim-26.1.3-windowsx86-64.zip",
        sha256 = "3665f6c1231bce429f2199c378e26be3a98156ac63511fabdae9bd49e5c90ebb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.3/wpiapi-cpp-sim-26.1.3-linuxx86-64.zip",
        sha256 = "b2f75c0c223262ed4cca996f448ca5b707e690718c8d0692ccbfe07dc9d89100",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.3/wpiapi-cpp-sim-26.1.3-linuxarm64.zip",
        sha256 = "a84aa310763f7c7fbed55691e1bc4446a0f0078d7348b27f7e2a32ec469217ef",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.1.3/wpiapi-cpp-sim-26.1.3-osxuniversal.zip",
        sha256 = "1cf08647d19055916b26d4599d1d905e1b5f7e3fe00b6284456cc88a27be51ca",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.3/api-cpp-26.1.3-windowsx86-64.zip",
        sha256 = "38fe3972b36a7f5df727ae1d259881ec0ef21f20924794faf342f62a68a41ff8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.3/api-cpp-26.1.3-linuxx86-64.zip",
        sha256 = "7a6a70d88c2d4e89137f59e3bf9c3869d974f4d3c085cbe4a5ffc8cea159161d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.3/api-cpp-26.1.3-linuxarm64.zip",
        sha256 = "4462d57fca75604fd0f73b41e4faeb64ae850f93357060edeb5121455290d35b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.1.3/api-cpp-26.1.3-linuxathena.zip",
        sha256 = "e2592646824c50fab96fcfc87189e90c627e506937a933fb4319c902f49047de",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.3/api-cpp-sim-26.1.3-windowsx86-64.zip",
        sha256 = "202764f3cada81337973db7b49bc427f42b6575cd6b685a4571a2439467aecb8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.3/api-cpp-sim-26.1.3-linuxx86-64.zip",
        sha256 = "c9faaa150557cf77fbb52b8411e0207eb25bc185e1b42d1aed86bfa5c331ca2d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.3/api-cpp-sim-26.1.3-linuxarm64.zip",
        sha256 = "483ea1e2e39f701e2b468969145baf3ff45ee09eb7864606ec752a30e6ff204c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.1.3/api-cpp-sim-26.1.3-osxuniversal.zip",
        sha256 = "dba39a6c83569969d9f87e0cdcca9359c82bea73e5e2b70eadac89e43a58c7a9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
