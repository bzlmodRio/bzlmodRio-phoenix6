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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-1/simCANCoder-25.0.0-beta-1-headers.zip",
        sha256 = "a3d8d75007249776dd811f1a78c3d6407bbc017048a45634a5b1cb4fb5a9c72a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-1/simCANCoder-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "e86f76893a4dd2fa861344ff7f00038c3bca16e79c4096a373d9e70cbd0ad536",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-1/simCANCoder-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "4b08ae68113f56c6249d86dfab390d4eed30813c26550b34294ece29d441ee4f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-1/simCANCoder-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "eaf7dc54e056824dde99c7ab75c381903a2af6da77681354ab7b2e33223bc1ee",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-1/simPigeonIMU-25.0.0-beta-1-headers.zip",
        sha256 = "a3d8d75007249776dd811f1a78c3d6407bbc017048a45634a5b1cb4fb5a9c72a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-1/simPigeonIMU-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "ce5c4979b36ed88c344a3252fe7a3ff3fd46bf511eac522964670652ef4be9b4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-1/simPigeonIMU-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "bb1d8a295e6add235962abe9fdad310fb5e86e8077f29682b994699cd91096b5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-1/simPigeonIMU-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "b30d9ee1184a4046fdd66b4eade2f289bfe367cb620ea149fd0c6d7fa8393a3b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-1/simProCANcoder-25.0.0-beta-1-headers.zip",
        sha256 = "a3d8d75007249776dd811f1a78c3d6407bbc017048a45634a5b1cb4fb5a9c72a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-1/simProCANcoder-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "8f9bce11032162b3969905c054f792dc5cc6d3ef9688d5f54e8c879bef4c3100",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-1/simProCANcoder-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "53aa626ef674bd9afe43de4b9597dda62907bbf3c0ac112703a31f64775ba9b5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-1/simProCANcoder-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "8e94c76c7e57a78008f8807bd751e218e1899e83909aef34372957ca4aad4a16",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-1/simProPigeon2-25.0.0-beta-1-headers.zip",
        sha256 = "a3d8d75007249776dd811f1a78c3d6407bbc017048a45634a5b1cb4fb5a9c72a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-1/simProPigeon2-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "d8f71b5247c868a8931035a306b8f98d922e424bee92eddc763232a389ca19e7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-1/simProPigeon2-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "7f231cf3599989e7e6f7fa32afd08f58d595773b8f11db062777fe08f06e0438",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-1/simProPigeon2-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "135a7a8313730b64b3f30cbba76a06fa56954e61c26befdd1c86111703bfce72",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-1/simProTalonFX-25.0.0-beta-1-headers.zip",
        sha256 = "a3d8d75007249776dd811f1a78c3d6407bbc017048a45634a5b1cb4fb5a9c72a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-1/simProTalonFX-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "78af2202aadfad838ba2b368ab4552fbb20b47a0395b010dbcba2c70596c26f2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-1/simProTalonFX-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "5d071737e7b1dd4524c529fba7c7785b5b7beae02787d41d4bff465de54c3bb8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-1/simProTalonFX-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "b327c02bb8cc3d8fe4aaf8bc3e82e243fde328eb6816f31689c38bf5acad438c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-1/simTalonSRX-25.0.0-beta-1-headers.zip",
        sha256 = "a3d8d75007249776dd811f1a78c3d6407bbc017048a45634a5b1cb4fb5a9c72a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-1/simTalonSRX-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "25be6acdf0e9e00870d5630d284e5fef48700690591a3cc261f34036d05543f0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-1/simTalonSRX-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "2c7341aa69b3ae0171c245e6ab8b9d9090f3f417521e88d76e6755569554f973",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-1/simTalonSRX-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "81b0bf16bd1c91a8bfb23a3a12e5e0bab8cb1411166baf39b2d7f2b22737af9e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-1/simVictorSPX-25.0.0-beta-1-headers.zip",
        sha256 = "a3d8d75007249776dd811f1a78c3d6407bbc017048a45634a5b1cb4fb5a9c72a",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-1/simVictorSPX-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "379eb3abf2017b39d5bb9a23ad6ae168ed1e9d931c81b76410dfe4134e00e0ff",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-1/simVictorSPX-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "f6aac5e57c259c04838423071cb82a4d3e33114bf3a13fa39e33dbe81a88ddbf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-1/simVictorSPX-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "8b5477b767659bb82c2bb48fd0f348330c1f6e76b578a377f39e3a91dee35627",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-1/tools-25.0.0-beta-1-headers.zip",
        sha256 = "f700f233cdc98df71415eb4cde0074a10d95073308539cf394e158d1d0c2d664",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-1/tools-25.0.0-beta-1-linuxathena.zip",
        sha256 = "7ff8fccaa647c40ad773d55ec9fa6179ac378f5a1ef012cbdc3833710983acb7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_replay_tools-replay_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/replay/tools-replay/25.0.0-beta-1/tools-replay-25.0.0-beta-1-headers.zip",
        sha256 = "f700f233cdc98df71415eb4cde0074a10d95073308539cf394e158d1d0c2d664",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_replay_tools-replay_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/replay/tools-replay/25.0.0-beta-1/tools-replay-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "6dca087e5d8ba03f7eeb2d98fe23fd108985214a4e6af982f790e84712533188",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-replay:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_replay_tools-replay_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/replay/tools-replay/25.0.0-beta-1/tools-replay-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "d586eed4408b2c4a3170652b6ec172d9948a7834ca55851b6440c81ce69d9ae9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-replay:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-1/tools-sim-25.0.0-beta-1-headers.zip",
        sha256 = "f700f233cdc98df71415eb4cde0074a10d95073308539cf394e158d1d0c2d664",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-1/tools-sim-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "839c39c400a57714eb7b1641c669aeb6c2af12336ef333a331ca02fd484f3959",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-1/tools-sim-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "1b8092d40c683d7b7e10b746bcfd7f0e154c54e74d5e0d874c26ea494583c730",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-1/tools-sim-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "b698cdc49421940482e87d13418a8f3440dc36a035dbf578e544cfca10cec75e",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-1/wpiapi-cpp-25.0.0-beta-1-headers.zip",
        sha256 = "ee51e0e88a4210830c6b739e903cbd656faa028271cc7bd3372cfb5bdb46fd28",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-1/wpiapi-cpp-25.0.0-beta-1-linuxathena.zip",
        sha256 = "c0b620760cc0cba66ab8dc6a4fa5102d0c8f3a59d52c8d7e5552b257cec62503",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_replay_wpiapi-cpp-replay_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/replay/wpiapi-cpp-replay/25.0.0-beta-1/wpiapi-cpp-replay-25.0.0-beta-1-headers.zip",
        sha256 = "ee51e0e88a4210830c6b739e903cbd656faa028271cc7bd3372cfb5bdb46fd28",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_replay_wpiapi-cpp-replay_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/replay/wpiapi-cpp-replay/25.0.0-beta-1/wpiapi-cpp-replay-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "b787bd532cbe5f824ab7144c482a4438f0d67e8c4997511549801349d8a91eeb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-replay:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_replay_wpiapi-cpp-replay_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/replay/wpiapi-cpp-replay/25.0.0-beta-1/wpiapi-cpp-replay-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "6d9a567611b7901312c1eaa08ab73bc132783c7872bc4197b1ee74c1ec7bacba",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-replay:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-1/wpiapi-cpp-sim-25.0.0-beta-1-headers.zip",
        sha256 = "ee51e0e88a4210830c6b739e903cbd656faa028271cc7bd3372cfb5bdb46fd28",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-1/wpiapi-cpp-sim-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "1d06660b6a4cdec7f9833a584046eff1fd18ef720703f57bb34f15c1be1d0f8f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-1/wpiapi-cpp-sim-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "cc78b7c8b638d98bd7a166bb731ef07f96fcc89cda01a63c54cb7169eaaebadd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-1/wpiapi-cpp-sim-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "0df9ec47607514dc8ec011c34a2fafdfa2c87cea88c9877ad7ff4f43e0c94aed",
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
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-1/api-cpp-25.0.0-beta-1-linuxathena.zip",
        sha256 = "7dbc4ec449a9e2c808376fa6c05dde5b52db8943ce8d60e7510e1055688c4b51",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_replay_api-cpp-replay_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/replay/api-cpp-replay/25.0.0-beta-1/api-cpp-replay-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "dbd264afd848d19d512925d36dbb5052624a68d5a914c78d94a619a95e124741",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-replay:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_replay_api-cpp-replay_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/replay/api-cpp-replay/25.0.0-beta-1/api-cpp-replay-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "e95b887d869177ca209f80110032ca15e65d04fde1837fbb6bcde40fbfdd6306",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-replay:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-1/api-cpp-sim-25.0.0-beta-1-windowsx86-64.zip",
        sha256 = "8302cc6e76a190c093b13300e0056a18254853da757547b282d6cad5e676f3fa",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-1/api-cpp-sim-25.0.0-beta-1-linuxx86-64.zip",
        sha256 = "2972e556ff3e2089f274d462ce719d0403b081020f19251a3806a7470b433853",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-1/api-cpp-sim-25.0.0-beta-1-osxuniversal.zip",
        sha256 = "5665877cd87bc35f286841534562a584886253a11fd750a475127b1ebbb2c4f6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
