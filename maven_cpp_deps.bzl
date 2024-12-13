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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-4/simCANCoder-25.0.0-beta-4-headers.zip",
        sha256 = "d384dd0437e2faed569a61a32fc2e7c528504ffa2a3467efb7666e701d7855ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-4/simCANCoder-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "0dca174c14423eb46400a5a4acab4028069c904cfb23919582cf58419713d51c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-4/simCANCoder-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "aa2c0d979ff4f34238c14e81525160db4b2654dd854cd867f1dec3a2d0a89afc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-4/simCANCoder-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "c1f4ed0f1de48d444bb140eb6506be4d83ce7febf6dd7e744a6742ea6b9a9258",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-4/simCANCoder-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "3cbb02a11a3fd85f9dd03b85e3fe348a85131ae507f9d134bafd03615b6bfa08",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-4/simPigeonIMU-25.0.0-beta-4-headers.zip",
        sha256 = "d384dd0437e2faed569a61a32fc2e7c528504ffa2a3467efb7666e701d7855ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-4/simPigeonIMU-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "13ef6682b941f8b0b0f14a6dee1b4d40b750778a4350fb658c0b344aec7c7ea4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-4/simPigeonIMU-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "e7e428c5a02df447f7943dffb0ea783fe8352becf6f4b909bdd03a3dfe8ed618",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-4/simPigeonIMU-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "c194d707f6c91ea02ca1d11302b8f850323cbd6306ce83cfc520568c55624db1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-4/simPigeonIMU-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "8ef505b639434633ca6d21f02230e3825f874f1c5a8ccc472220c7fa2ffefc81",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-4/simProCANcoder-25.0.0-beta-4-headers.zip",
        sha256 = "d384dd0437e2faed569a61a32fc2e7c528504ffa2a3467efb7666e701d7855ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-4/simProCANcoder-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "b9bd2ce5befd98e1f74bf7f327e7759568261870343104c9f2ff797e5f1d27c8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-4/simProCANcoder-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "8c7fac50a077815ba603b9fd5283e1d2d86b5975e5a828cb2501fbbe82638496",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-4/simProCANcoder-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "814d36b0f19784de8e1a66d2f9dc11bba9d848c8a39e3d33c0f5832ce8e9c4ed",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-4/simProCANcoder-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "b46c7d19d267d5d7fce34104a68aef5901e872fb4511ab88959c8676e9d5b08e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.0.0-beta-4/simProCANrange-25.0.0-beta-4-headers.zip",
        sha256 = "d384dd0437e2faed569a61a32fc2e7c528504ffa2a3467efb7666e701d7855ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.0.0-beta-4/simProCANrange-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "25a92950d7af0c40b404006c904a6666926fdc1db9aa49fddfd5b58425443e8c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.0.0-beta-4/simProCANrange-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "811ec854f871f7ea3f084b0caeac3d5a47be743ea4eb83e087f624bb093d74c1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.0.0-beta-4/simProCANrange-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "3fcc61f6fa3b69a1cafc1226cc501f95ed9a3ac689213fbd1c73060d24571ee4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.0.0-beta-4/simProCANrange-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "4368af0d821a1f0e32e9f7a46530cb0a529432651a045ee584b6e0c47a4a776b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-4/simProPigeon2-25.0.0-beta-4-headers.zip",
        sha256 = "d384dd0437e2faed569a61a32fc2e7c528504ffa2a3467efb7666e701d7855ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-4/simProPigeon2-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "4ae3e310a41a1edcf6823a23e651f98dbbcfdb1fe70ee4ad4a98992e11ee39ca",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-4/simProPigeon2-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "8dbdc81d476ba4d0fa311958bef9e1396742d8ffa4f9cadb4c97b36ae47c05a7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-4/simProPigeon2-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "be08ed48beb5b23552ba7d2e930a3d9f2159e428e7f2dc3504287cb121b88886",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-4/simProPigeon2-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "63bd8cb5bd52cf976987ac9428aa84e19d6054f41332c0e87a931c747097ce55",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-4/simProTalonFX-25.0.0-beta-4-headers.zip",
        sha256 = "d384dd0437e2faed569a61a32fc2e7c528504ffa2a3467efb7666e701d7855ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-4/simProTalonFX-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "a145f5784b21f8f554a679eace82e9e1177f8aed613e8a4eccab56a212c0d14b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-4/simProTalonFX-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "fd9d3dbb5f1c6cc4bd6bf7d6f48a9bac34538d0c9dc8619925d41da605d74acd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-4/simProTalonFX-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "d4acb28d54f2750f6e07008a75d55b8548b5d62ef8a38f50f2cbc5bfdfc69a44",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-4/simProTalonFX-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "1b4f6f99e18eb12c356dde1eed76d2415cdc3dcbc01de27e98decbb45032f2d6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-4/simTalonSRX-25.0.0-beta-4-headers.zip",
        sha256 = "d384dd0437e2faed569a61a32fc2e7c528504ffa2a3467efb7666e701d7855ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-4/simTalonSRX-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "72c7d5949fa173cc5f98167da1bd5f6e4ffae0af1e58cedd7b92fd17617355be",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-4/simTalonSRX-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "dd4585a00ee90a9d749129740ad2d3027ce258f11543c78346a94fca913351b1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-4/simTalonSRX-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "68bf490f7bac1e857f6cf40487d525ba951369c68946ca9847eb50c873a9c6ce",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-4/simTalonSRX-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "ad235bb5ba8748e5ca66a52402d816d6fd712c9b2593b2ef27cbfbead41dab78",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-4/simVictorSPX-25.0.0-beta-4-headers.zip",
        sha256 = "d384dd0437e2faed569a61a32fc2e7c528504ffa2a3467efb7666e701d7855ff",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-4/simVictorSPX-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "0ebc8e1d31154febb19e080ab75aff3137832250a821c8bd37f5ce4134e0acc2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-4/simVictorSPX-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "7f1ff0bcb6a269d00407deb09752dd8442a8fcb1f9d34902189a91ed1590825b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-4/simVictorSPX-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "5b37d6c60a703bec3dffeb0bbc4d9cf380f0817dfa52f267d01c4476a0f37cd4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-4/simVictorSPX-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "5a5842b5c0543a9009a598484c79e3de16dcc9d5460922247fc3d3077afeaeaf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-4/tools-25.0.0-beta-4-headers.zip",
        sha256 = "566ad8dcdd3060e90eff2d20b7acc1d81247f3daa4a3b5b86d423dca6790e4de",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-4/tools-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "b48a830a53357f8cc5c83c3e0d1f03c6ff51aed9ebe62888c075193d8265f14a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-4/tools-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "2bc02189c5951276130b190004dc4546fa4b3655f0e6016b36ce4562823b502c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-4/tools-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "c9b57732e2dcfdc7eb95fa43ccaa261bbaf99f9154888e44c1ab12bea5f64ba5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-4/tools-25.0.0-beta-4-linuxathena.zip",
        sha256 = "9ebee87eed02e72642aa0a5f42c5c6a53c5e1278ab51b9f49fc48031aacf2e84",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-4/tools-sim-25.0.0-beta-4-headers.zip",
        sha256 = "566ad8dcdd3060e90eff2d20b7acc1d81247f3daa4a3b5b86d423dca6790e4de",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-4/tools-sim-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "ca0baef99e3feca280fff6072c657f202d57be873a939691d8861130737af8bc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-4/tools-sim-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "494c0c2f54a967c9aaa7e7fe47ced93aa1a057b362b850a20a6048b0945531c2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-4/tools-sim-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "340f537b4368d5f6880ca1687179c12d6d5767539da0a6afd9188cf4ffafae05",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-4/tools-sim-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "e970aa01313c2a93f9b8a9bd1f57caf3098c319cbe125293ea843348d1537cda",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-4/wpiapi-cpp-25.0.0-beta-4-headers.zip",
        sha256 = "e142145d74fc186772accf1c474d5dfbef6ae0f621a3acdb0dc916f026c0b9b8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-4/wpiapi-cpp-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "90f958ac0d981095167efa18dc4963428be555b623f48874c8dd967f71ba8821",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-4/wpiapi-cpp-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "9deb9ebc4fc7ed9631b31ae99b259d2f3e1ca00360b22045fc081f4f6ef806c0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-4/wpiapi-cpp-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "befb35d3387286295ac95a6b080658b6b62efec9537c76c483916ce92978a137",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-4/wpiapi-cpp-25.0.0-beta-4-linuxathena.zip",
        sha256 = "9a16f55f4ef9261b31f323d368033cccae8d9325c66915cb5a6992355bf2c669",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-4/wpiapi-cpp-sim-25.0.0-beta-4-headers.zip",
        sha256 = "e142145d74fc186772accf1c474d5dfbef6ae0f621a3acdb0dc916f026c0b9b8",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-4/wpiapi-cpp-sim-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "7b23c704091690ec3118fd76f82104909ff7046b05f790f8ac52623d66b52f1c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-4/wpiapi-cpp-sim-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "620cdd96c88791441adc2e1417604f2df1731cc5844351551a453657aa1b2890",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-4/wpiapi-cpp-sim-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "4f8eb4e16c33b096a8352473676a36a4a757e7fce48c65d75179e5b938546514",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-4/wpiapi-cpp-sim-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "0ca2ba62e11c87a757f63c594ea2d0cd2c215124114fdd630a0812c2d4bee94e",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-4/api-cpp-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "18892e1521f001b1c6115277fb444c39fd7601aca30cf1ed7e44bde92785c370",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-4/api-cpp-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "8d322b8906d368807b303992ef3d3e6fa22500ebb568e795c874ceba191180a8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-4/api-cpp-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "cdbce9b96619dad7d005f294eae3946d7e834b8fc13d1494955820bb91b2a48e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-4/api-cpp-25.0.0-beta-4-linuxathena.zip",
        sha256 = "35864d861a990e0ea4489b35a1580cc0c156d979c9b2a64d73b8a734d426ed3c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-4/api-cpp-sim-25.0.0-beta-4-windowsx86-64.zip",
        sha256 = "6c62c2fe2a1441e81c92f5f806346a24bacb60a8841d5c65c8409d3bf29c1424",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-4/api-cpp-sim-25.0.0-beta-4-linuxx86-64.zip",
        sha256 = "8140a895b369ef642a397bd15ce46f0cbcbc2b0a20985f65069441e797db977e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-4/api-cpp-sim-25.0.0-beta-4-linuxarm64.zip",
        sha256 = "c0f4a5870f474d8da0125ce4da66c0d1c2d0aec958307643b285ca9ee2656830",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-4/api-cpp-sim-25.0.0-beta-4-osxuniversal.zip",
        sha256 = "8bfb4ac4d77fa0b0633df7b0036aa3d3a9520eb9f8d5fc6e04e1bf8661c67c87",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
