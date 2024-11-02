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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-2/simCANCoder-25.0.0-beta-2-headers.zip",
        sha256 = "3db5d57a99dbf5972010c840925a2c79643d0d213318fedfe6fadbbed113b64d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-2/simCANCoder-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "eb27d902190f9888570810a94be0977e6b983003dcd996ec93e86c2b3b80141b",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-2/simCANCoder-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "625cbd6aee9339b0e0f55576ede2734768cefcf41e641bedff7288a8f32329a9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simcancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simCANCoder/25.0.0-beta-2/simCANCoder-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "52f02a5d2b33b7b2ae2b8d72330bdc997ffb2cc33db3489d98c3104c1f84c9bd",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simCANCoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimCANCoder.dylib osx/universal/shared/libCTRE_SimCANCoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-2/simPigeonIMU-25.0.0-beta-2-headers.zip",
        sha256 = "3db5d57a99dbf5972010c840925a2c79643d0d213318fedfe6fadbbed113b64d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-2/simPigeonIMU-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "4b06b9ec37a9eaf64cd85f42047fea8ccff05140d5ba1a70d4b1a217d269700f",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-2/simPigeonIMU-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "cae61eb2c4716eeea13b95815fbad516fc870298c4a78b83dc902eb5d9a94b1d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpigeonimu_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simPigeonIMU/25.0.0-beta-2/simPigeonIMU-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "16d43942338912f3325aff7f8754ded145a522b325e638accf25d39a4db67b89",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simPigeonIMU:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimPigeonIMU.dylib osx/universal/shared/libCTRE_SimPigeonIMU.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-2/simProCANcoder-25.0.0-beta-2-headers.zip",
        sha256 = "3db5d57a99dbf5972010c840925a2c79643d0d213318fedfe6fadbbed113b64d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-2/simProCANcoder-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "4beb256c0173b0295ce588bf431f4a73bb28804489b49a80fab149e3217ad172",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-2/simProCANcoder-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "cd48f7d788649c804c6638694b2a8d247930888a1bec3834cbfe09a73e19afb9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprocancoder_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProCANcoder/25.0.0-beta-2/simProCANcoder-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "62091812e8c1d65f559065e40ec64f4d188453266cd28707ee529899283c9905",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProCANcoder:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProCANcoder.dylib osx/universal/shared/libCTRE_SimProCANcoder.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-2/simProPigeon2-25.0.0-beta-2-headers.zip",
        sha256 = "3db5d57a99dbf5972010c840925a2c79643d0d213318fedfe6fadbbed113b64d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-2/simProPigeon2-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "7d45eb6afdc6bddc292fa9aeed29f99346bc4bf2d615319ac89d7b131dfde196",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-2/simProPigeon2-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "473f4cbdd193dd2e57cc10f373e7db3e5a2a74bb2aea374e43f0784b584a027e",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simpropigeon2_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProPigeon2/25.0.0-beta-2/simProPigeon2-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "954b9947fa5e8f0271186566a87f87df04ad50f34fa252c8f705044b1191f0f0",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProPigeon2:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProPigeon2.dylib osx/universal/shared/libCTRE_SimProPigeon2.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-2/simProTalonFX-25.0.0-beta-2-headers.zip",
        sha256 = "3db5d57a99dbf5972010c840925a2c79643d0d213318fedfe6fadbbed113b64d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-2/simProTalonFX-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "e1fb4bb825acc10db9724706bc28e8ac6928fb2ae291999d14bafda882edca16",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-2/simProTalonFX-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "d40c84e2fa6d0856df6c411d1b32f02f3792ea993e072cb9bdbc3721f0ed22ca",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simprotalonfx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simProTalonFX/25.0.0-beta-2/simProTalonFX-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "0826cd36a729ec0ae2ea719db673b59ebe04675fc0742338b2ae563cbae609f9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simProTalonFX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimProTalonFX.dylib osx/universal/shared/libCTRE_SimProTalonFX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-2/simTalonSRX-25.0.0-beta-2-headers.zip",
        sha256 = "3db5d57a99dbf5972010c840925a2c79643d0d213318fedfe6fadbbed113b64d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-2/simTalonSRX-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "ef4d04a8d4b9cdd46c04635a924384e3c7f89dc90c4d0d4934a8d665a383182a",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-2/simTalonSRX-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "9480875ddf05f05c52663ecd9e0a83de3193414ccea4d2c169b1338dfccc2acc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simtalonsrx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simTalonSRX/25.0.0-beta-2/simTalonSRX-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "5fc13087da80af96b36c1d858b8ea4b83468f2000002828a680c81458e1db269",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simTalonSRX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimTalonSRX.dylib osx/universal/shared/libCTRE_SimTalonSRX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-2/simVictorSPX-25.0.0-beta-2-headers.zip",
        sha256 = "3db5d57a99dbf5972010c840925a2c79643d0d213318fedfe6fadbbed113b64d",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-2/simVictorSPX-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "9a70c63d7339161794320830669d74efb3b4b61ab0bcfba85bec9d5945413ec8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-2/simVictorSPX-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "cd90739058a951fbecda6926148bc8d9832862750068e456d22f563b243317a4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_simvictorspx_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/simVictorSPX/25.0.0-beta-2/simVictorSPX-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "3fd1f85de97dc4021aa84078aead0a7887384b6eecbe446e79f059b9c8541f08",
        build_file = "@bzlmodrio-phoenix6//private/cpp/simVictorSPX:shared.BUILD.bazel",
        patch_cmds = [
            "install_name_tool -id @rpath/libCTRE_SimVictorSPX.dylib osx/universal/shared/libCTRE_SimVictorSPX.dylib",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-2/tools-25.0.0-beta-2-headers.zip",
        sha256 = "c3c27d327af5d7b3fba2f2859d9a63f22fb506ca157fb817f6ec88d65113c46f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-2/tools-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "6c6b143d8a93ea58e2cac641151b782d903a8fbd2fabfe13b5629f48d73dd909",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-2/tools-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "842b4bd9cf25ab242ee96ebebfeec628b744bdb519b80e606c2121726cdf94ae",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_tools_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/tools/25.0.0-beta-2/tools-25.0.0-beta-2-linuxathena.zip",
        sha256 = "a60d1687d65412da2353cc3f1362f8722c012770e99157d185b0f01e7f2f14f9",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-2/tools-sim-25.0.0-beta-2-headers.zip",
        sha256 = "c3c27d327af5d7b3fba2f2859d9a63f22fb506ca157fb817f6ec88d65113c46f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-2/tools-sim-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "522696569a7ac679f962556788e6544229ee64e5b0eb15f7032a1e2015bd59bc",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-2/tools-sim-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "38199c0b9242b8242fe30efa82c8b2782db5f42c28f6c3e2092196af4270abf8",
        build_file = "@bzlmodrio-phoenix6//private/cpp/tools-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_tools-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/tools-sim/25.0.0-beta-2/tools-sim-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "02b60360070244255cf8651d806a86f42ffbd226188e1e423937116d6528511b",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-2/wpiapi-cpp-25.0.0-beta-2-headers.zip",
        sha256 = "7db861d565245ef7f46b496520f97a6bdd91458188fa065750c3dba8c58eb393",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-2/wpiapi-cpp-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "d0d88e0141a51b2099f2a1b08e9e9756e9f4d501064776d67e3cdfad23a52d26",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-2/wpiapi-cpp-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "ea5f276dda13aea35a83b6e5cd0d87ff9516960d22f461f87db7bdf28e3feccf",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_wpiapi-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/wpiapi-cpp/25.0.0-beta-2/wpiapi-cpp-25.0.0-beta-2-linuxathena.zip",
        sha256 = "5a5f0ad51114b560215f13b56f25e35c1a81fb4a6f4dc7e8c8d1b2411dd82856",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_headers",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-2/wpiapi-cpp-sim-25.0.0-beta-2-headers.zip",
        sha256 = "7db861d565245ef7f46b496520f97a6bdd91458188fa065750c3dba8c58eb393",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-2/wpiapi-cpp-sim-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "7c0cbce39a2f093085690c16156b14be06312b168b4534c5eed4904eb7778c80",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-2/wpiapi-cpp-sim-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "7e988d8d1d12d7d6aaabcd61221a096e7b39418bb966790f0b8e4a8ba2e3e6e4",
        build_file = "@bzlmodrio-phoenix6//private/cpp/wpiapi-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_wpiapi-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/wpiapi-cpp-sim/25.0.0-beta-2/wpiapi-cpp-sim-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "0ba7053e1e8f4ba55238b3fdc3fc8ad946c834c8d8dce225dcbb30a8aaa131a1",
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
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-2/api-cpp-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "5fb8dc52eb760bb0f568b844c74742946f8dd5f9b12c10f8be8ab04968e885ca",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-2/api-cpp-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "d7c69c5c8ca5442351ecc529345b0eda121f1fe5cbcfb3a6201f0006852691c1",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_api-cpp_linuxathena",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/api-cpp/25.0.0-beta-2/api-cpp-25.0.0-beta-2-linuxathena.zip",
        sha256 = "73dbed15f31ca1f1dbd53ac2aab57bc812a248331940523c18f012fd8759229d",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_windowsx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-2/api-cpp-sim-25.0.0-beta-2-windowsx86-64.zip",
        sha256 = "600502533f01ad8652b87474947cb1b118dcfc5395fa75c14681ca93ce5d6957",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_linuxx86-64",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-2/api-cpp-sim-25.0.0-beta-2-linuxx86-64.zip",
        sha256 = "a5c970cac35651ee54b4eb53fe5f271ce02db421edaf8173fd37fdf5875a5b36",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_com_ctre_phoenix6_sim_api-cpp-sim_osxuniversal",
        url = "https://maven.ctr-electronics.com/release/com/ctre/phoenix6/sim/api-cpp-sim/25.0.0-beta-2/api-cpp-sim-25.0.0-beta-2-osxuniversal.zip",
        sha256 = "ac700f6e0c97353953e166b9143166b932fc4375382e553da89ad2d86e8a1294",
        build_file = "@bzlmodrio-phoenix6//private/cpp/api-cpp-sim:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_phoenix6_cpp_dependencies():
    __setup_bzlmodrio_phoenix6_cpp_dependencies(None)

setup_bzlmodrio_phoenix6_cpp_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_cpp_dependencies,
)
