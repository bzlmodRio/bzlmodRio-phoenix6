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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.0/simCANCoder-25.2.0-headers.zip",
        sha256 = "16f0b990e8057e554f263959bd8f69485c6b26f91b5d79dad3e823d8614c8c4c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.0/simCANCoder-25.2.0-windowsx86-64.zip",
        sha256 = "e311a9355f828499c4a0deceffdf2248b02ae4c9f17f5dd14f7f7a53e3b9772e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.0/simCANCoder-25.2.0-linuxx86-64.zip",
        sha256 = "939c6e69daf5460dce7045e61c6f943576053e75e9586497c00725ac07998670",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.0/simCANCoder-25.2.0-linuxarm64.zip",
        sha256 = "4e4ed952ddd2bc44f34a6cd2c59fc6e560c958e660ec2007e55cfbcfb435b689",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.2.0/simCANCoder-25.2.0-osxuniversal.zip",
        sha256 = "8edd5862d58e0862ff8c5b597479813f5157c37460a41e6df133fc48c6744fc4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.0/simPigeonIMU-25.2.0-headers.zip",
        sha256 = "16f0b990e8057e554f263959bd8f69485c6b26f91b5d79dad3e823d8614c8c4c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.0/simPigeonIMU-25.2.0-windowsx86-64.zip",
        sha256 = "4f820679e2ce277a32242f554f7e5072dbea96c793230e4223d8aa47d8d62adc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.0/simPigeonIMU-25.2.0-linuxx86-64.zip",
        sha256 = "4957ec30edac4c9a23576bae8a629c3e42f8b36590ad5f37c6f43793838de27c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.0/simPigeonIMU-25.2.0-linuxarm64.zip",
        sha256 = "67abbc9e46b2366dd44b6ea1246ee73c3dcf4c0ca061f7f4c5b5b30233e81469",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.2.0/simPigeonIMU-25.2.0-osxuniversal.zip",
        sha256 = "5b7e43226758d397025bb1657f1358ca98ee3f200833597a6b7fe24b0ab48123",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.0/simProCANcoder-25.2.0-headers.zip",
        sha256 = "16f0b990e8057e554f263959bd8f69485c6b26f91b5d79dad3e823d8614c8c4c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.0/simProCANcoder-25.2.0-windowsx86-64.zip",
        sha256 = "d4c1898b747bbe9ef936459dc9078134a976b74d78d657de069accacd5ab965f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.0/simProCANcoder-25.2.0-linuxx86-64.zip",
        sha256 = "aea29bc983bd9724d09ab7473d245aabd0d404e4cafb7c88919dc97ca905b38a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.0/simProCANcoder-25.2.0-linuxarm64.zip",
        sha256 = "f099cb05095539486004f16de7777113e8548e6d8f929b37a3dec18407a8a792",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.2.0/simProCANcoder-25.2.0-osxuniversal.zip",
        sha256 = "fe453eff3ee439d6567cebe36668c3e7b084da7d8e599e188390b61736464830",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.0/simProCANrange-25.2.0-headers.zip",
        sha256 = "16f0b990e8057e554f263959bd8f69485c6b26f91b5d79dad3e823d8614c8c4c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.0/simProCANrange-25.2.0-windowsx86-64.zip",
        sha256 = "3d790d359392985730ab2073844165c0f2dfe6e2b28e62756f60feb0b484c26e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.0/simProCANrange-25.2.0-linuxx86-64.zip",
        sha256 = "dceaf15e9ebaad9b155cd4b662e537a3c0e0082dabd73ff732dd362ffe66e0b4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.0/simProCANrange-25.2.0-linuxarm64.zip",
        sha256 = "7bfab5fa3222aeecc39ac8483d03eb115ca37f804d85fbcd5855178d11567ba7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.2.0/simProCANrange-25.2.0-osxuniversal.zip",
        sha256 = "5a3eab7d69985e04a10fbbb4b313d2915085087aa9e657d4ca2807188a7a9cbd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.0/simProPigeon2-25.2.0-headers.zip",
        sha256 = "16f0b990e8057e554f263959bd8f69485c6b26f91b5d79dad3e823d8614c8c4c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.0/simProPigeon2-25.2.0-windowsx86-64.zip",
        sha256 = "51265f7891c8f0314dddf0b6ca1063ea09b3e52b16f1eadd745f7d1845e4fe45",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.0/simProPigeon2-25.2.0-linuxx86-64.zip",
        sha256 = "9280e3a57fad3c772c48bd89a86a73f3330b9b43cb78ece9247669b5aacecf26",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.0/simProPigeon2-25.2.0-linuxarm64.zip",
        sha256 = "6e7a819a5155047bdb0f18d3d0ae0548a4518033139f8b18202c2076e3318087",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.2.0/simProPigeon2-25.2.0-osxuniversal.zip",
        sha256 = "ba7979b3e4bab8c5f06677829a15484ff31df7fbb4c09bcffd58db501d5e3570",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.0/simProTalonFX-25.2.0-headers.zip",
        sha256 = "16f0b990e8057e554f263959bd8f69485c6b26f91b5d79dad3e823d8614c8c4c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.0/simProTalonFX-25.2.0-windowsx86-64.zip",
        sha256 = "67d01f577a566ab96c3151a9b5c6875adfc9a68b9c720f5d96b1986aeb6646bd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.0/simProTalonFX-25.2.0-linuxx86-64.zip",
        sha256 = "3cbc1c7493aa2d00b86b3058580ece803aefbd544ebe64d95c46f9fb19980c23",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.0/simProTalonFX-25.2.0-linuxarm64.zip",
        sha256 = "ffd26dc283862c6ff1bacaf4c8b463b784f2cd1f07afac06e3b822a739f61b5a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.2.0/simProTalonFX-25.2.0-osxuniversal.zip",
        sha256 = "4cff95eed5d867358968e1357b5038cc7d9072a8bb1e64c394a00d3f9af4d278",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.0/simProTalonFXS-25.2.0-headers.zip",
        sha256 = "16f0b990e8057e554f263959bd8f69485c6b26f91b5d79dad3e823d8614c8c4c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.0/simProTalonFXS-25.2.0-windowsx86-64.zip",
        sha256 = "3b39fee9a2c2042d67c8bf4abd69db045663f0f3dc53a64a598e826a80754b8b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.0/simProTalonFXS-25.2.0-linuxx86-64.zip",
        sha256 = "2b9eddf91c4e9cac7e668c00b3c818de0e563c7f8634c50de8082d65cad75380",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.0/simProTalonFXS-25.2.0-linuxarm64.zip",
        sha256 = "43789f888fd4f6c0016eba4f950a86f12aa86ea707995893e512f46faa469d99",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.2.0/simProTalonFXS-25.2.0-osxuniversal.zip",
        sha256 = "a1d146d6f77c638cd7a412828acf585aef9e68b96494489d58f9d3746c06cd79",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.0/simTalonSRX-25.2.0-headers.zip",
        sha256 = "16f0b990e8057e554f263959bd8f69485c6b26f91b5d79dad3e823d8614c8c4c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.0/simTalonSRX-25.2.0-windowsx86-64.zip",
        sha256 = "1cfbf776b72a40c3f4ea5413ae7b44b03c5ed4838544874db11a887736d66ce4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.0/simTalonSRX-25.2.0-linuxx86-64.zip",
        sha256 = "357f96329b3c6bc1be6592f4afe87f8b3f3bd32da4b69c0bbfd827089ca16313",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.0/simTalonSRX-25.2.0-linuxarm64.zip",
        sha256 = "d7060c53f0de33be4c08eca06af9676f9195d46404de6d34de9558dabdd1344d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.2.0/simTalonSRX-25.2.0-osxuniversal.zip",
        sha256 = "ff1c54a154d3117c18d1fd74969a19029bbadc688e85c11292ed301479079bfb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.0/simVictorSPX-25.2.0-headers.zip",
        sha256 = "16f0b990e8057e554f263959bd8f69485c6b26f91b5d79dad3e823d8614c8c4c",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.0/simVictorSPX-25.2.0-windowsx86-64.zip",
        sha256 = "b942eaa0951d849cb9f65067aaee33d0747179aac35d5714bc13d506dc4883c5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.0/simVictorSPX-25.2.0-linuxx86-64.zip",
        sha256 = "507a47d9215f2f96631f5ef5484c0544e2205af34d6f60c8496ae469ab3b674c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.0/simVictorSPX-25.2.0-linuxarm64.zip",
        sha256 = "a8e285c0275b8b8de9cac1b4c90447eb4203d2c09505de2e14143a6ba615d6d4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.2.0/simVictorSPX-25.2.0-osxuniversal.zip",
        sha256 = "c30b2f55a8cee73eb5ae5b1bef9faec2dd73caf11e462d6057e192860f7d36ef",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.0/tools-25.2.0-headers.zip",
        sha256 = "0eb25bafd6fd42e152475544d3d19f14e2f4a8fd502fc2550368a26ddc0d0ad3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.0/tools-25.2.0-windowsx86-64.zip",
        sha256 = "b077ade6462797efd67139de17c948c82017902032fbe0462ea06cfdaa985d5a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.0/tools-25.2.0-linuxx86-64.zip",
        sha256 = "5f24152fcb0422422a5b3e9217f4bd40c86f71283c1d964856b725f912646e17",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.0/tools-25.2.0-linuxarm64.zip",
        sha256 = "c1cb1f9569bc7d7c60489918f34dfc851a69d038391e8f760172bc2fec8dade7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.2.0/tools-25.2.0-linuxathena.zip",
        sha256 = "39359a899aa3db13a7f7c2566f45f0f82efb474b71a0b6e7a235f8a69c7d3279",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.0/tools-sim-25.2.0-headers.zip",
        sha256 = "0eb25bafd6fd42e152475544d3d19f14e2f4a8fd502fc2550368a26ddc0d0ad3",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.0/tools-sim-25.2.0-windowsx86-64.zip",
        sha256 = "2b4dd46312cd8282939fe29997d39f23205631ca751b588ca87c928802924192",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.0/tools-sim-25.2.0-linuxx86-64.zip",
        sha256 = "4b7a05907454f2fa44fb21b7f2e971f2758b3fa3634695c031ef7b716dea46c8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.0/tools-sim-25.2.0-linuxarm64.zip",
        sha256 = "67f39f0d89964e0db51f1dcf25ea635a23ba54b7ee86e2148015b84ad3d93372",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.2.0/tools-sim-25.2.0-osxuniversal.zip",
        sha256 = "d61121c8ad6fd302851f81238bc84c79feccbcc09ae1ce0b59050482be58ead8",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.0/wpiapi-cpp-25.2.0-headers.zip",
        sha256 = "beb1d1dcf22161857270df599d69c081fc33d18942248d88d192770a3a3575e4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.0/wpiapi-cpp-25.2.0-windowsx86-64.zip",
        sha256 = "8a9ace0fd899be94f47889e674f6db2928ecb39f3a59ecd58f408a59b26ebda3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.0/wpiapi-cpp-25.2.0-linuxx86-64.zip",
        sha256 = "84fa692c082c4e7a400e64d5604835a03e0fc7387358f005d797b99e6f616605",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.0/wpiapi-cpp-25.2.0-linuxarm64.zip",
        sha256 = "61be2bfcfbb2a66c693955570cd9819a1dfd844eed1b078443c99acea18347d2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.2.0/wpiapi-cpp-25.2.0-linuxathena.zip",
        sha256 = "7377fab245abc18b3292cd40d6eac5cbff179af8d64bed5f25d5bcd1d10933b9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.0/wpiapi-cpp-sim-25.2.0-headers.zip",
        sha256 = "beb1d1dcf22161857270df599d69c081fc33d18942248d88d192770a3a3575e4",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.0/wpiapi-cpp-sim-25.2.0-windowsx86-64.zip",
        sha256 = "1a39689c6e3e2bf407daccba69e1aadeaa2482abd44bbf00e2f4e974ecd7885a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.0/wpiapi-cpp-sim-25.2.0-linuxx86-64.zip",
        sha256 = "9ebc9361c343ebe9582b150dccbe7797846f8a6383c3b37733204e799f96a7f0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.0/wpiapi-cpp-sim-25.2.0-linuxarm64.zip",
        sha256 = "95c9a9d024bd166ad3cf16984ca0324a8d1f4822ae830314ceb9cd6b19e602f0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.2.0/wpiapi-cpp-sim-25.2.0-osxuniversal.zip",
        sha256 = "2574043098f9ae32dbaf9bbab235fea46a7da942c1850e48c08227dc48b210ee",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.2.0/api-cpp-25.2.0-windowsx86-64.zip",
        sha256 = "79bc8ce8cb3a2943d0662af68ad62dcd8aa0c2dab85e857d56942fce8d2ef8cc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.2.0/api-cpp-25.2.0-linuxx86-64.zip",
        sha256 = "92e7bb436078d752b49a3837f4f6539464e3fd7bfab9218d345b2d1695c4da7e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.2.0/api-cpp-25.2.0-linuxarm64.zip",
        sha256 = "b5781d30e3c424035853760b03481ddf6563f09ecba8f91d9e51d0b3076f0976",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.2.0/api-cpp-25.2.0-linuxathena.zip",
        sha256 = "7ddf3c1bf61b6173a31c03f68c62b10a0daa624312f2997c543947cdf988448e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.2.0/api-cpp-sim-25.2.0-windowsx86-64.zip",
        sha256 = "46f38389f7193bec70a6a9a478e07331e407165364670317569e82e4490c24e6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.2.0/api-cpp-sim-25.2.0-linuxx86-64.zip",
        sha256 = "a73b5c32857f52beaafb81124c95dbf7f7b462f46a7d8ae49fd05b62013e68f2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.2.0/api-cpp-sim-25.2.0-linuxarm64.zip",
        sha256 = "517ebd19dcf89f8bbe0d0a52d992a846e4390337e1b77f0f5ea41b7a7cd5f5b4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.2.0/api-cpp-sim-25.2.0-osxuniversal.zip",
        sha256 = "a8b6a906e808505a88a4f4efaf71aee9ffef049b0f04c49d8cb6a995a558b9e0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
