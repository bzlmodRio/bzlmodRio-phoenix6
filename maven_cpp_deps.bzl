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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.4.0/simCANCoder-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.4.0/simCANCoder-25.4.0-windowsx86-64.zip",
        sha256 = "3c25dca9f2605ca4201770a7a086054caf60b887d06384d9d97b0d00a38c9e89",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.4.0/simCANCoder-25.4.0-linuxx86-64.zip",
        sha256 = "ed6e0e6eb92c4f379cb0579a62fc7c55fc234ad6378428d54b612d3346b13192",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.4.0/simCANCoder-25.4.0-linuxarm64.zip",
        sha256 = "4c99b6b2b5c42efeb23f948861462b0b837204d49ae369a79beab49dff280214",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.4.0/simCANCoder-25.4.0-osxuniversal.zip",
        sha256 = "3b8f7f75fd113b3293701c63f6698df2f5bc9d9fb483f15977891dc8390ce126",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.4.0/simPigeonIMU-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.4.0/simPigeonIMU-25.4.0-windowsx86-64.zip",
        sha256 = "2712ce70d18944620115cf17c4db7e22d5b8be0cc44cba244abd18663432b2d2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.4.0/simPigeonIMU-25.4.0-linuxx86-64.zip",
        sha256 = "8127315c6e760877a2c598ff5854133edcc04cc7b564f9c54ecee9e478c4c912",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.4.0/simPigeonIMU-25.4.0-linuxarm64.zip",
        sha256 = "7c5a61e6624b8d9fadfd9292e56b96b7a8e27db727e299e9293ae31586efbe32",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.4.0/simPigeonIMU-25.4.0-osxuniversal.zip",
        sha256 = "4b0d1a46b2473cb937020b0eb0b80eeed26d8a94ea9baaa7646903dd56d28ac1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.4.0/simProCANcoder-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.4.0/simProCANcoder-25.4.0-windowsx86-64.zip",
        sha256 = "a067428bdb7b55219e8a2333df2f97c5b5db4aaa1b0e69352734e79fd4552b08",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.4.0/simProCANcoder-25.4.0-linuxx86-64.zip",
        sha256 = "da211b3d5cec7878a54d1f14843a0f79a3359a94627f98f919e0eeb41fddf9d3",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.4.0/simProCANcoder-25.4.0-linuxarm64.zip",
        sha256 = "b06b7f353c0a921863ca0c66b80a7cc4639958a5b57f36f14792a12e9aa40b89",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.4.0/simProCANcoder-25.4.0-osxuniversal.zip",
        sha256 = "16213c0c173f799f9ecec1a7e8c8776973128dbe252a426dc5ea779068ccccae",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.4.0/simProCANdi-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.4.0/simProCANdi-25.4.0-windowsx86-64.zip",
        sha256 = "82e79e240f5c52b9c2d55874ff640ddeb98bea6f3ae6bcbf3762669a3a25b2b8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.4.0/simProCANdi-25.4.0-linuxx86-64.zip",
        sha256 = "76135d6bae33332992a2ffd14b2eba45f1ac693335c0730d8c907d862536a8d0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.4.0/simProCANdi-25.4.0-linuxarm64.zip",
        sha256 = "fbd51c3d60a79afd40548fd16c7947006041a11dc26cc818785fd92165800b50",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandi_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdi/25.4.0/simProCANdi-25.4.0-osxuniversal.zip",
        sha256 = "350a2123d884322f409a6c84abff0c1c31accaa7d05e9b5ed957fe7d3be5c627",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdi:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_SimProCANdi.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.4.0/simProCANdle-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.4.0/simProCANdle-25.4.0-windowsx86-64.zip",
        sha256 = "c6930ab2d2bc461b4e79948cd2fabcc1406a3beefca2864aeb57ba5650e3cef5",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.4.0/simProCANdle-25.4.0-linuxx86-64.zip",
        sha256 = "bf65d0d8882175b7a4c02c8b2b4d3297906ee13216d342e35af4d2cc44703469",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.4.0/simProCANdle-25.4.0-linuxarm64.zip",
        sha256 = "ee900ac56b9fe1a214fd9a8b789e6dcc48a61470318bc8c756ac3b17a568fe81",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocandle_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANdle/25.4.0/simProCANdle-25.4.0-osxuniversal.zip",
        sha256 = "3b73acec657d5c23766c643f484701082569762c0ed251d91d95c49d7b075c72",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANdle:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.4.0/simProCANrange-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.4.0/simProCANrange-25.4.0-windowsx86-64.zip",
        sha256 = "8f25f1eae1ff3ca3b1c36a0618963617b7cbf6c264ca03a87b48bd70e3883200",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.4.0/simProCANrange-25.4.0-linuxx86-64.zip",
        sha256 = "1422ba2455c0a00ac6e4b96bbb0dbb4a7ce42a8d9d1c7c0feb13f65d523b221e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.4.0/simProCANrange-25.4.0-linuxarm64.zip",
        sha256 = "34cde4d60ae284bc8db86cd2d9cb0c633415177bf3e1679dd8c3b90a166b7f3f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocanrange_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANrange/25.4.0/simProCANrange-25.4.0-osxuniversal.zip",
        sha256 = "24ac2f6402bb6ab814fa2fb6ea3cc5785ccf16636ae15f1e245be0af437559e9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANrange:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANrange.dylib osx/universal/shared/libCTRE_SimProCANrange.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.4.0/simProPigeon2-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.4.0/simProPigeon2-25.4.0-windowsx86-64.zip",
        sha256 = "23b8adfa20015d91f7fea1660f175045d94e8f5171667e346452d10259ad6ea6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.4.0/simProPigeon2-25.4.0-linuxx86-64.zip",
        sha256 = "1a6756eefbb222f62f2d079ef10ada084b17f423b05f911ec30c413bf1fd9c50",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.4.0/simProPigeon2-25.4.0-linuxarm64.zip",
        sha256 = "77ed6888c10e22cc9450accfe3db2d4912fe9fe6b63a4193cf6d874038cc86c6",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.4.0/simProPigeon2-25.4.0-osxuniversal.zip",
        sha256 = "4f8665fa96e1d4be6ed03af33b94865ad462936afd2aa342d3a73db1ada4ff6a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.4.0/simProTalonFX-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.4.0/simProTalonFX-25.4.0-windowsx86-64.zip",
        sha256 = "4a2aa218742b6fde67141f78f4e20afb475513c70ee6b12a44ce6f9f1a8d804d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.4.0/simProTalonFX-25.4.0-linuxx86-64.zip",
        sha256 = "a0f87f4b3643d1f2b2d32f232302f662990a7f1c12eda5ec813f47161e313726",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.4.0/simProTalonFX-25.4.0-linuxarm64.zip",
        sha256 = "aa3535956f8c6650dd69016887e9ea87c79bb9360537b60502914a683410e114",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.4.0/simProTalonFX-25.4.0-osxuniversal.zip",
        sha256 = "daa7bdae6a01583e3c229d791c542fea59902b406102c13cae140bd49a777821",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.4.0/simProTalonFXS-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.4.0/simProTalonFXS-25.4.0-windowsx86-64.zip",
        sha256 = "8ae4f6285288c05c9c52b497f6a1e8e0aa8542d4934e3de48f8137453362ba82",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.4.0/simProTalonFXS-25.4.0-linuxx86-64.zip",
        sha256 = "a74941f3e476eb8e57dbb36601749d84f3d77890471c2a328e19e454dd5f10cb",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.4.0/simProTalonFXS-25.4.0-linuxarm64.zip",
        sha256 = "cacb63f99a7d2adbc0ca9cc2d21eb94ce77ed095a62db293638269370ab7f088",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfxs_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFXS/25.4.0/simProTalonFXS-25.4.0-osxuniversal.zip",
        sha256 = "70158daa8ffb6892537bcf6e8065b27e5978327085d4b7813697011013daa296",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFXS:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFXS.dylib osx/universal/shared/libCTRE_SimProTalonFXS.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.4.0/simTalonSRX-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.4.0/simTalonSRX-25.4.0-windowsx86-64.zip",
        sha256 = "b9883c5c2fa10b68ce8d25cc82c827524143b5df7e541a7cbf6737be4475e057",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.4.0/simTalonSRX-25.4.0-linuxx86-64.zip",
        sha256 = "3eb2927308fc0493d2ae010d677a6aab137f0b096e8129a396f738a047a94c01",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.4.0/simTalonSRX-25.4.0-linuxarm64.zip",
        sha256 = "bac87c1902c092cbe350f59069fb3fae4522116c2612251a42579b566b491ea8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.4.0/simTalonSRX-25.4.0-osxuniversal.zip",
        sha256 = "16ad41825b7ad969a0fd8652275f36d0b5b775537bf5d71c93afa9c8fa068ba2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.4.0/simVictorSPX-25.4.0-headers.zip",
        sha256 = "21f6eef2451ca0b13abeb0fc9338c92f477d33e6e7001e99ad1d1909a253d7c1",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.4.0/simVictorSPX-25.4.0-windowsx86-64.zip",
        sha256 = "6edd862371b0dde3e5cdb0d5ccf43c46a751ed13ebb585327988b764e1503384",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.4.0/simVictorSPX-25.4.0-linuxx86-64.zip",
        sha256 = "7971a2dfc841094d61a3f54efca5c537111d3b4e18e95df035eac550837ae810",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.4.0/simVictorSPX-25.4.0-linuxarm64.zip",
        sha256 = "3e26e6e370e22fb7e7ce87a68452939d7c3656c3dfa97828a6315dbf566172e1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.4.0/simVictorSPX-25.4.0-osxuniversal.zip",
        sha256 = "281ed6e42e229b0a80c7cb528def24ef623b9c7d40df3feaeb11bd0b2ba63ee2",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.4.0/tools-25.4.0-headers.zip",
        sha256 = "da84898c5d4b646372aec7742d4d2f7ab5fd9d41efbce5d67bd21ead01fae037",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.4.0/tools-25.4.0-windowsx86-64.zip",
        sha256 = "c4a17c61f49b2a5db58e741d465bfae84ad370537f90839a5235f18b7442d9b0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.4.0/tools-25.4.0-linuxx86-64.zip",
        sha256 = "cad60d34ce4b005c5fc56d9420d1f692acfade3da761ef51ab84b9da4fd9c76a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.4.0/tools-25.4.0-linuxarm64.zip",
        sha256 = "baade99a85c2409d477ca060209583641a5f260b8b393fe4c988de1cf098d613",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.4.0/tools-25.4.0-linuxathena.zip",
        sha256 = "13bbbf889bf7adace46db8b77cac315314cdf052bd80b95534bb101bc76349a8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.4.0/tools-sim-25.4.0-headers.zip",
        sha256 = "da84898c5d4b646372aec7742d4d2f7ab5fd9d41efbce5d67bd21ead01fae037",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.4.0/tools-sim-25.4.0-windowsx86-64.zip",
        sha256 = "96a0c14a740778f53f2f44ca9dfa8308d6a258bc878a3f97a19f4df3a3181905",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.4.0/tools-sim-25.4.0-linuxx86-64.zip",
        sha256 = "e3032f1d054468e448a7685a15e793c73d46223ac8289da78d6ab8f3c326e0bd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.4.0/tools-sim-25.4.0-linuxarm64.zip",
        sha256 = "5dfbf220e1f5dd4dcc09f4bd5526ab839faa5dd6d81238bbd57949eb09aa790b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.4.0/tools-sim-25.4.0-osxuniversal.zip",
        sha256 = "c5e00560069616d6ad30b3a51a373b10fad4b0cbfd36f50ac56d0daaa6ade21a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProPigeon2.dylib @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimProTalonFX.dylib @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimTalonSRX.dylib @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
            "install_name_tool -change libCTRE_SimVictorSPX.dylib @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_PhoenixTools_Sim.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.4.0/wpiapi-cpp-25.4.0-headers.zip",
        sha256 = "b37db80a1e9a71985aec3e95cf990f050343cbc4db79ba412633a1fc219617b2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.4.0/wpiapi-cpp-25.4.0-windowsx86-64.zip",
        sha256 = "7553c6ada99ab1c6496e631381dd6deb0a4e198e7cede09c1816ba8c875bc4d9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.4.0/wpiapi-cpp-25.4.0-linuxx86-64.zip",
        sha256 = "604f2240fa78e2bd8448e8b776a13d7d5cf246c6b56f04cdbf37c300a304ac34",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.4.0/wpiapi-cpp-25.4.0-linuxarm64.zip",
        sha256 = "7f0a1ea190477c8894ab4235e9642cb7ad264f0303b33c3dd3147302f0b827ae",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.4.0/wpiapi-cpp-25.4.0-linuxathena.zip",
        sha256 = "0f72461674cd273943428e2bd168d3c6c2cc7f65d36d44216fe9d847726e73cd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.4.0/wpiapi-cpp-sim-25.4.0-headers.zip",
        sha256 = "b37db80a1e9a71985aec3e95cf990f050343cbc4db79ba412633a1fc219617b2",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.4.0/wpiapi-cpp-sim-25.4.0-windowsx86-64.zip",
        sha256 = "96f0630202883e627e8b506c16024f98a73dbb40349f147908565dbc9d5d322d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.4.0/wpiapi-cpp-sim-25.4.0-linuxx86-64.zip",
        sha256 = "d981f205a8faefc0229b1e780507e365985b935bfb6615a68f8fa5e2a452fbcc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.4.0/wpiapi-cpp-sim-25.4.0-linuxarm64.zip",
        sha256 = "254e291523c4da047662d40be2c80555be9a2e523983a1f99e8a406f4a3d74a7",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.4.0/wpiapi-cpp-sim-25.4.0-osxuniversal.zip",
        sha256 = "39c6333ab947fdaa0344602f8dbe8d991228130cde86026d565d6712e7b86e0d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_Phoenix6_WPISim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_PhoenixTools_Sim.dylib @rpath/libCTRE_PhoenixTools_Sim.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimCANCoder.dylib @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimPigeonIMU.dylib @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANcoder.dylib @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
            "install_name_tool -change libCTRE_SimProCANdi.dylib @rpath/libCTRE_SimProCANdi.dylib osx/universal/shared/libCTRE_Phoenix6_WPISim.dylib",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.4.0/api-cpp-25.4.0-windowsx86-64.zip",
        sha256 = "d896899651d30b994301aeb2eb24e483803a90a60d37d9d94e6dc3a84edddb1a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.4.0/api-cpp-25.4.0-linuxx86-64.zip",
        sha256 = "96bf3d96524f114eeda31f2450ce6e0c1f4c4d2ba4be8c6fe0cf4f2c8540143c",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.4.0/api-cpp-25.4.0-linuxarm64.zip",
        sha256 = "81fb76d6145a85e054e5b995a95d62afaea624ae5033294d960f6856b69ac17e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.4.0/api-cpp-25.4.0-linuxathena.zip",
        sha256 = "f8ba4cca3374bc07e41f9d025ea32a52ec00d4e691783e380a5fd309d658e6ea",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.4.0/api-cpp-sim-25.4.0-windowsx86-64.zip",
        sha256 = "79b6f4f7d2192009e395b3fe1325f8a9b19e82f3e5a644a0c5d9ccf4bc4680c4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.4.0/api-cpp-sim-25.4.0-linuxx86-64.zip",
        sha256 = "4324ec1303e60124186976cca9146527dd4e990acd0d15fe72863a8f6b9c0f66",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxarm64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.4.0/api-cpp-sim-25.4.0-linuxarm64.zip",
        sha256 = "0cd25487233520491ff1a9dd8e878b7e1fca6d1cc597b55a95fcf8113ddce1d0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.4.0/api-cpp-sim-25.4.0-osxuniversal.zip",
        sha256 = "2322208e41f2ed97e637954590ea8b3ae4ed3af17f0c22e06e29d1893fb213c9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
