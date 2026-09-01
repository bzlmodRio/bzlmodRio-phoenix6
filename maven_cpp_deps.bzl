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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.50.0-alpha-1/simPigeonIMU-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.50.0-alpha-1/simPigeonIMU-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "6673c1749dafbb5d47ca7a55c47e12922148b99ba05e62b1498f8a4fcc7fb4f0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.50.0-alpha-1/simPigeonIMU-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "df997fc2d841526d884944bafa3df697cf634503d9c92ada63fd560998515a99",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.50.0-alpha-1/simPigeonIMU-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "e417871cf9a7fc81c7a14f7975b3f0bcadb9a62db023f851f0662865fe0f4c05",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/26.50.0-alpha-1/simPigeonIMU-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "a2bd4d41dacf8edabf99ff2d18145ca02b71a7b372cad2b537b786484cef6c57",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.50.0-alpha-1/simProCANcoder-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.50.0-alpha-1/simProCANcoder-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "906ba78a4a09086a0b568925a54ecd4ec6b2eadc549149584948b09fb2c8ed58",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.50.0-alpha-1/simProCANcoder-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "356fa3ba749e9b212fcae8eff8b3a9ad36825867ba1898f052e369bdd5ecd14c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.50.0-alpha-1/simProCANcoder-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "9c6ed90175698ec4b20fedc19fb0f371173da545d5c7e773ade8343f4ef49df3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/26.50.0-alpha-1/simProCANcoder-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "ff5651f006b25ed066e337b15fbaf3da2179e013c5e0a83f5c1bd3a7e8cf2b90",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.50.0-alpha-1/simProCANdi-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.50.0-alpha-1/simProCANdi-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "c4dd69e417029d6201c635aa0d45721344669fb1b87a8b3f2580c84e287c9ecd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.50.0-alpha-1/simProCANdi-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "d32da4b3e9de803abb1c42eac013ed12286d7128aa6fde78d7b9c9208dd93570",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.50.0-alpha-1/simProCANdi-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "3bb2ddbc097b1b8ce791c8af1b6178c44afdb187385a5e87d2cb906472b3727f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/26.50.0-alpha-1/simProCANdi-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "688db18e7651f2da10fd157338c87b2895e161cd38403013b36b3281bd7019d2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.50.0-alpha-1/simProCANdle-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.50.0-alpha-1/simProCANdle-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "f6ceee93cd676a5c27cebdf4b8807903144389eb2a1362c254fc6204f7e1cdaa",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.50.0-alpha-1/simProCANdle-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "6183b05dc15b5dbd8f53c1e8c02a2c68bb425e26ab1af074f1c7a94c4cd3bf21",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.50.0-alpha-1/simProCANdle-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "e4a3f4fdd498700468ddeee169e33e59ca357f874863ae0f381518f8b13fd53d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/26.50.0-alpha-1/simProCANdle-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "50092370f34fb2a84f5e1103d67a8d342a764b66bfcc512fdfd0030b9465f4ca",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdle.dylib osx/universal/shared/libCTRE_SimProCANdle.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.50.0-alpha-1/simProCANrange-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.50.0-alpha-1/simProCANrange-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "2d7594fadc2207965eb54c411d5138f014a1767bc37d1de3f1463a250308608e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.50.0-alpha-1/simProCANrange-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "294c19a39aeb700664a11fe65ad01fa5f20463fbd44f57da0e75eaa9dcd3d6f0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.50.0-alpha-1/simProCANrange-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "b1658a030ce13cac98f1650a52fa90558dbe62570fa8fb941db586b102fba136",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/26.50.0-alpha-1/simProCANrange-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "41b2a0adbc7a27839ee8a3a78b5cdd6fb3ad4bfd5fd9d6fbb4fc3d92d61923f9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.50.0-alpha-1/simProPigeon2-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.50.0-alpha-1/simProPigeon2-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "f96c9ba5cd9af887f21381c4033fcce8d04d631834bc1c7b16e02afb46f5c94d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.50.0-alpha-1/simProPigeon2-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "effd328a7c8c0e55e45147b3d6cf74ea8ce0e2d1b584b385b625c7799f79fe00",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.50.0-alpha-1/simProPigeon2-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "ae05026ce80e0273b1a8b4ffd3c27a6018a1ec44c7f29e1a7c559cbcdd440d1d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/26.50.0-alpha-1/simProPigeon2-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "64661857ef466a7baaf1daebd0ef107209aad6639a492b4b37ec75e2bfded25f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.50.0-alpha-1/simProTalonFX-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.50.0-alpha-1/simProTalonFX-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "bd1247bf86bbc5391ef7c815c55e5a38b98ea59e477adcada77351276f43aceb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.50.0-alpha-1/simProTalonFX-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "6a52457e80a9645bcd58ed8e068374f781f105fa282b5a9f53606cd07cee5dbc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.50.0-alpha-1/simProTalonFX-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "2162a0aeea718f984eab306798878f9bb8882e4972d7a6e8267555487f9459fc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/26.50.0-alpha-1/simProTalonFX-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "26955c33854f7b6827488d058f8bca63c392bebadf97157f68a4b4ec4717e826",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.50.0-alpha-1/simProTalonFXS-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.50.0-alpha-1/simProTalonFXS-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "c204f9462fda1a0832ab24ee603ad23494e1f85bd19b90308843824e99310742",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.50.0-alpha-1/simProTalonFXS-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "d483aff2d71ca33cb5cae9de2ef5728f958b18f8a7639e351a53649cdfb1d8a7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.50.0-alpha-1/simProTalonFXS-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "10fdd1ad77c65d7fa4a7efdf54bdcf8c52b10ddb9e31a3eb349b4eed6d9fd9b4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/26.50.0-alpha-1/simProTalonFXS-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "a0c657e3bc4b92c2023fd1540ebe40b0db680c746c6e7ad3b61cad5a4aee0a18",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.50.0-alpha-1/simTalonSRX-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.50.0-alpha-1/simTalonSRX-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "e65322c26d42b9376ebbded9cd9b2f169970efbd362959c671489da464653691",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.50.0-alpha-1/simTalonSRX-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "6175f8b03dc5074278b5581c697e657b457e6fc2d22fb31a885d41ba82543d24",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.50.0-alpha-1/simTalonSRX-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "4101c8a0c367ab21d9ccf7cd5516a475ee1657f15624efc857fb50ba0a0937d1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/26.50.0-alpha-1/simTalonSRX-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "755b3e6af804d78a83e9f764b66c8c1b6eb625828f119fbb15957e3ca1faf63c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.50.0-alpha-1/simVictorSPX-26.50.0-alpha-1-headers.zip",
        sha256 = "5e1a41004316e8baa098ce040e746a51c1aa67df20aa3a46ac6c1131acad7bc6",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.50.0-alpha-1/simVictorSPX-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "7757dd25783b1691e96e5d69d0df38f4f83580cb11ee9f7a5c4bae99b5896d1b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.50.0-alpha-1/simVictorSPX-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "6d29d2df02f020385d59db187f8ed20914e59adafd71a5be44000dc1c9937ee8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.50.0-alpha-1/simVictorSPX-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "c07ee286af67099316b8c284d8787c1b4fdb8e36d0bee28a18ae12bb609725a1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/26.50.0-alpha-1/simVictorSPX-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "f9eb6c457e8251ef57c53e535df7ab92e23fa2223034b7e387307c89f749d714",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.50.0-alpha-1/tools-26.50.0-alpha-1-headers.zip",
        sha256 = "df7385adbec7c1907681b4e0cfae9e93065d22de5f5c01ac33c941b8c3f128cf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.50.0-alpha-1/tools-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "e18683d5a68aa9321456c34b9c6b8ed5a3f8e85aba4fd3115c35a2a99dc1129c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.50.0-alpha-1/tools-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "cc9c371384cf9a3cb498307f93b960fe12fa1ee2ae8a8503b97ac90d6b49b82d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.50.0-alpha-1/tools-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "913549415411460985bf2359a5ebf2b2ce200b8ee023f02783d458aae77ca066",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxsystemcore",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/26.50.0-alpha-1/tools-26.50.0-alpha-1-linuxsystemcore.zip",
        sha256 = "196de5d5042c8ce289f0479d5b0b9826b936bfa5f5abc5fb993247dbd72263ef",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.50.0-alpha-1/tools-sim-26.50.0-alpha-1-headers.zip",
        sha256 = "df7385adbec7c1907681b4e0cfae9e93065d22de5f5c01ac33c941b8c3f128cf",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.50.0-alpha-1/tools-sim-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "9a6b8031eb8fab837caeaa4d1bb0f844d5c987c8647c2b79812be7c40d1befec",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.50.0-alpha-1/tools-sim-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "c32247c051d43c974c7df0306b34265098aedae08fe355dcbecab1c4520b8608",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.50.0-alpha-1/tools-sim-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "d5c80d436eacb90b7e02559df77c74d9bebd5bad6f7820545e22ac363ec5ce0d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/26.50.0-alpha-1/tools-sim-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "d58afdd1814388336b407dc37b2b971d2687ab271b2895c98523ac56fcc09f83",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.50.0-alpha-1/wpiapi-cpp-26.50.0-alpha-1-headers.zip",
        sha256 = "2fcb2ef678d92f4a558404954d089f7dd94b367649141b9c359c82819a015871",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.50.0-alpha-1/wpiapi-cpp-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "5cdc5bc403d3f490c459dd7a7f6d6962b96bc030405a8aaa42e20aed88d3dce0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.50.0-alpha-1/wpiapi-cpp-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "c87db5652040eb04c7c9a0f0b31fc377951aeb490e2f49807b3b3a1cc07ca662",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.50.0-alpha-1/wpiapi-cpp-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "0e922625de2f9b15785084a64385d08bdffbe11c416da66a2faf7509806e6aae",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxsystemcore",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/26.50.0-alpha-1/wpiapi-cpp-26.50.0-alpha-1-linuxsystemcore.zip",
        sha256 = "6a676544df7b8af9a4c1901132d227fe1fe869a2f7538b441d726aa3e6a55b02",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.50.0-alpha-1/wpiapi-cpp-sim-26.50.0-alpha-1-headers.zip",
        sha256 = "2fcb2ef678d92f4a558404954d089f7dd94b367649141b9c359c82819a015871",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.50.0-alpha-1/wpiapi-cpp-sim-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "3f6dc4ddc5a9df5f7859c122b2fa68919d17edf8fff8e25f96c97ef2976c803e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.50.0-alpha-1/wpiapi-cpp-sim-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "60e8fc7bc5511256d4f3c0969e046d54ebc079da9e8ede821ce03f23d0d189e5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.50.0-alpha-1/wpiapi-cpp-sim-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "eb5dbb8b32b4fb1b8c3b4c1e0080b49c62128f12e0610ede07fc65fcb8f54dbe",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/26.50.0-alpha-1/wpiapi-cpp-sim-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "53d7fcb7d8d25e87f388a87bb5f00775b58f583c97635f76a09f5c822c0262ce",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.50.0-alpha-1/api-cpp-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "19a6ec902935e8ee911e6963d2590378bf5c6e77f483a499bab3aacea75150e6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.50.0-alpha-1/api-cpp-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "a70883ca4b17cdf9c8ca31ddcba2f9ca65cfbebeefa5830cde25159ac286356c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.50.0-alpha-1/api-cpp-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "eacc08b2e2129869265c12008a9bd8df17e5c026e72e84673233767668e57353",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxsystemcore",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/26.50.0-alpha-1/api-cpp-26.50.0-alpha-1-linuxsystemcore.zip",
        sha256 = "c093afeffdbb4c43324ee075e651a8db7f9206839c334465c953d62c136d74ca",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.50.0-alpha-1/api-cpp-sim-26.50.0-alpha-1-windowsx86-64.zip",
        sha256 = "62909a4370c0fa73bb2e80b0fb482095ddc39356ccf066a8bd2440e639fd34d8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.50.0-alpha-1/api-cpp-sim-26.50.0-alpha-1-linuxx86-64.zip",
        sha256 = "d1af09843220537ed2d8f5507a8c5afda24bd617288e07575244986c60aa2a15",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.50.0-alpha-1/api-cpp-sim-26.50.0-alpha-1-linuxarm64.zip",
        sha256 = "2ae892044ece174f876c3697215773da82ae5f5a821d635c3ebd584b79db72c2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/26.50.0-alpha-1/api-cpp-sim-26.50.0-alpha-1-osxuniversal.zip",
        sha256 = "4a9c543a41bb05e9a1d8822b15bb84ba584883cb86f4dc2091de121309a0ec3d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

deps = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
