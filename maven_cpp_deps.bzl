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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-3/simCANCoder-25.0.0-beta-3-headers.zip",
        sha256 = "e5c39e1fcec6c1ebb5db66d24fceddbbb050c9993144a531710d763901984615",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-3/simCANCoder-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "716e4835b0bd9d925cac687a1060f3d52f23d3de1b473bf0f7e256e0851baff4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-3/simCANCoder-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "50ee1066dca1e1962f92d3c7ed97a0044a323890d0deef01c926f635e7349fbd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-3/simCANCoder-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "f3b1bf26a455463fd745ac706fce494f40cb9a101cf39a5120963dc18921778f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-3/simCANCoder-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "9b69faa3f959bbc005541c1b74538545cdad16f771137d6c84c72163686d7ee7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-3/simPigeonIMU-25.0.0-beta-3-headers.zip",
        sha256 = "e5c39e1fcec6c1ebb5db66d24fceddbbb050c9993144a531710d763901984615",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-3/simPigeonIMU-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "21cb4848475c9a2216e908498b49ecdf0814991ba673ebec04ef6f4c04f294dd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-3/simPigeonIMU-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "854801cc5913cc3baac9251f5226245a7975a61e9dc14a3b5ca6cede3de38793",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-3/simPigeonIMU-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "7b317f9b9b78abf7da4debfa849ab9ec17db128008296d522cccd6009a395627",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-3/simPigeonIMU-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "498a308d43a11cb40b6b0d35d00214bb94f11f39fdd861576be138ee6b7e51b5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-3/simProCANcoder-25.0.0-beta-3-headers.zip",
        sha256 = "e5c39e1fcec6c1ebb5db66d24fceddbbb050c9993144a531710d763901984615",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-3/simProCANcoder-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "53bf1b71a147156670ae39ba5e8a69322063a1c3bd9643c48576345735925d7f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-3/simProCANcoder-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "99ead3d441c9ea6ad6e7efe704eebd325a38fe0c13cae25246a66649073c78f5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-3/simProCANcoder-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "e62727571888daef11258b8f462dce4300d49ffdbe2308418eab56c779cc5072",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-3/simProCANcoder-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "048d43cad89efe917a75e1d5fde887d04b46f0173447e053e5cbc7ddc4a1ab1a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-3/simProPigeon2-25.0.0-beta-3-headers.zip",
        sha256 = "e5c39e1fcec6c1ebb5db66d24fceddbbb050c9993144a531710d763901984615",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-3/simProPigeon2-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "571626b4220d8737133f0186267004d9371d6043d10b963fa7865aae46c4ee7b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-3/simProPigeon2-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "dcef59aaddb0eed7327a332548d1cecfef3bee6af1b0830c711d1bacdd479043",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-3/simProPigeon2-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "3779829b263ab5e02701ff9a1e64dab8695650f35e554ef22e2177b4cb1302ed",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-3/simProPigeon2-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "1d31584801c6be703f497aea3e3c177616fb327919d77fca69474574f1ba3813",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-3/simProTalonFX-25.0.0-beta-3-headers.zip",
        sha256 = "e5c39e1fcec6c1ebb5db66d24fceddbbb050c9993144a531710d763901984615",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-3/simProTalonFX-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "8b49464f68bf8e27a76af10ea6621e754d5cd23ec11d2f46768e390abb9d34b3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-3/simProTalonFX-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "7d86e0d2373423dc45de36776c76d80c51ebeb30077b22c2f13cb5f006b4a455",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-3/simProTalonFX-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "e1c7b1bc735c5dd57bb6c4fd83f19c2245682204347c2acec4cfeadf2599c688",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-3/simProTalonFX-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "2c4794f091640b00899ca9ddd2defac8407cb9c5bfa57f9f589dc2621733586f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-3/simTalonSRX-25.0.0-beta-3-headers.zip",
        sha256 = "e5c39e1fcec6c1ebb5db66d24fceddbbb050c9993144a531710d763901984615",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-3/simTalonSRX-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "2cfaa94d22f5529fc6df7dc2b03ea3e731a682ea61046c4eff53b9e0a8c7167d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-3/simTalonSRX-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "de8454e765ce83a3ebf872637e1e01ddb0c78dcdedeb652b13d0775574d17d67",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-3/simTalonSRX-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "91a802b41fc1dcaa1c9eed32e76b6b089bfb28da5e57d972a11c7771c0f5dc5d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-3/simTalonSRX-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "b5986de1d6a560887750062cbf0223299d83a584efd1d941e268fe993d2227d4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-3/simVictorSPX-25.0.0-beta-3-headers.zip",
        sha256 = "e5c39e1fcec6c1ebb5db66d24fceddbbb050c9993144a531710d763901984615",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-3/simVictorSPX-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "58e6349e6fc6e3f6114fd56486e60a1bb1a0cf9b4a561f2f342b64495bb50fe3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-3/simVictorSPX-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "9cdacb2d3784f2be30d602fe7572b592e2bae3a89a5a32ebb28d8191e64e0960",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-3/simVictorSPX-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "ad443a931f3ee7ee85e6dab1a1ba14c0913f9e637ec9e8a24cec9bd453ee9e18",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-3/simVictorSPX-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "fccd3324f21bb1f4acf4787e3a8f8a7844bc8c4720bc589ed7460fdfa25a29a2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-3/tools-25.0.0-beta-3-headers.zip",
        sha256 = "0ba68b1ac02d21c950562f2facc241c9009704ee6097d44756d8f5acbd22a7bb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-3/tools-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "fea660e29f9038e540cc2d8447fde190a86e9c213792f4ebe3de00636580afee",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-3/tools-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "aa4aaeeabfbb1a4976c47d6efb812add58b61e951c9db9123564e2b279ad5550",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-3/tools-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "f262326622f51a2c80fd991774841dcb1297ba451de588c5ed98ec48e0b16168",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-3/tools-25.0.0-beta-3-linuxathena.zip",
        sha256 = "9058925a246fbf50fb17cd4d162c6615899bf297474453ab39472b4b7936696e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-3/tools-sim-25.0.0-beta-3-headers.zip",
        sha256 = "0ba68b1ac02d21c950562f2facc241c9009704ee6097d44756d8f5acbd22a7bb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-3/tools-sim-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "8a70e1cb4b6f3369847a291704827c33f4570e6bcd93de7b13992e319d90a6ee",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-3/tools-sim-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "7d6880000c5e68938b7bab241ff93dc25ad6113f9be62ab9320c8a18b14c1e65",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-3/tools-sim-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "ecb3174f6ede0429b29afda5a9e4d9bea841d9a7b3b3a10b88193b2a5a6b1da2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-3/tools-sim-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "38d8fa64c627357e9853768a53d3f5fc8b0b76eff36bcc196f07b1807485c86c",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-3/wpiapi-cpp-25.0.0-beta-3-headers.zip",
        sha256 = "eecd80fe547487b97cf38494186fcfa6d2b0aaae823c5f17a0cace8c9d3f4181",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-3/wpiapi-cpp-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "ccc109b1ea6e7f026ce1f27de02edcff2b02436889fd13be2ac4c7e2c5471485",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-3/wpiapi-cpp-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "522bf8c5533a06597265de9a33b64e582954959200ec5e7f2c52947423fcdf4d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-3/wpiapi-cpp-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "3e79984dbb3857aab5f5861a0c3ce839cb5c49ff1725d82882775a7ed3a42723",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-3/wpiapi-cpp-25.0.0-beta-3-linuxathena.zip",
        sha256 = "d81a9d78098d24343235dc97e631380861b3518e18cd1abf9b54ff17ab98cdf8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-3/wpiapi-cpp-sim-25.0.0-beta-3-headers.zip",
        sha256 = "eecd80fe547487b97cf38494186fcfa6d2b0aaae823c5f17a0cace8c9d3f4181",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-3/wpiapi-cpp-sim-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "5a892cdd69927b9d2ffe241d5d834709bd6472976323242d6c1440c9389e5eac",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-3/wpiapi-cpp-sim-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "9363ddbeda7753e21b49a57a7e36d76e28f6a53d62c35b3e8dfff3e2d283adb6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-3/wpiapi-cpp-sim-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "6bafed6e906d9e2140b6c7897e940bcbe10567fb391fb01e858a82bcf981c221",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-3/wpiapi-cpp-sim-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "65d3739c580511c5bf07b6d991a8da330f4845d44da6cfdc97ac922643632578",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-3/api-cpp-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "38ab8df741dc00093c155247279d274cd3f91838e3a8d91b9d7bc816bc3b994c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-3/api-cpp-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "1481df450dcf7e060d6f4d0b53c624be0f85a234b5c14334bb86122e229c5ba5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-3/api-cpp-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "a9b5d0fab71133dbda0171b72ee4b7684edaf734ade0db3e1a4acadf8dd25406",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-3/api-cpp-25.0.0-beta-3-linuxathena.zip",
        sha256 = "f887a8ee489d1b7a3e0e6d29e21adc0b822da995ec485b6b34e79a6f31c1c249",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-3/api-cpp-sim-25.0.0-beta-3-windowsx86-64.zip",
        sha256 = "c0f23fac345eb5fedf9a231a75ecbecbcc8de5f2fc514c67f661347d023eda09",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-3/api-cpp-sim-25.0.0-beta-3-linuxx86-64.zip",
        sha256 = "96ffefb7d78a12aa197f21f4fcd3d5a65c8a8230c9b40c93789400294232d179",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-3/api-cpp-sim-25.0.0-beta-3-linuxarm64.zip",
        sha256 = "99a6282635209e75afcba00bf9857429022dd4fd900c5b51a9d64a6a8b4d9010",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-3/api-cpp-sim-25.0.0-beta-3-osxuniversal.zip",
        sha256 = "a10861f871cec2e0efc8d36445028f3e3712bc8dd90fdfe3272be52505aa35cb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
