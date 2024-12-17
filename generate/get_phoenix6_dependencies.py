import os

from bazelrio_gentool.deps.dependency_container import ModuleDependency
from bazelrio_gentool.load_vendordep_dependency import vendordep_dependency
from get_allwpilib_dependencies import get_allwpilib_dependencies


def get_phoenix6_dependencies(
    use_local_allwpilib=False,
    use_local_opencv=False,
    use_local_ni=True,
    allwpilib_version_override="2025.1.1-beta-1",
    opencv_version_override="2024.4.8.0-4.bcr1",
    ni_version_override="2025.0.0",
):
    sim_install_name_classes = [
        "simCANCoder",
        "simPigeonIMU",
        "simProPigeon2",
        "simProCANcoder",
        "simProTalonFX",
        "simTalonSRX",
        "simVictorSPX",
    ]

    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

    allwpilib_dependency = ModuleDependency(
        get_allwpilib_dependencies(
            use_local_opencv=use_local_opencv,
            use_local_ni=use_local_ni,
            opencv_version_override=opencv_version_override,
            ni_version_override=ni_version_override,
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-allwpilib",
        remote_repo="bzlmodRio-allwpilib",
        override_version=allwpilib_version_override,
    )

    group = vendordep_dependency(
        "bzlmodrio-phoenix6",
        os.path.join(SCRIPT_DIR, f"vendor_dep.json"),
        fail_on_hash_miss=False,
        has_static_libraries=False,
        install_name_lookup={
            "simCANCoder": dict(deps=[], artifact_install_name="CTRE_SimCANCoder"),
            "simPigeonIMU": dict(deps=[], artifact_install_name="CTRE_SimPigeonIMU"),
            "simProPigeon2": dict(deps=[], artifact_install_name="CTRE_SimProPigeon2"),
            "simProCANcoder": dict(
                deps=[], artifact_install_name="CTRE_SimProCANcoder"
            ),
            "simProTalonFX": dict(deps=[], artifact_install_name="CTRE_SimProTalonFX"),
            "simTalonFX": dict(deps=[], artifact_install_name="CTRE_SimTalonFX"),
            "simTalonSRX": dict(deps=[], artifact_install_name="CTRE_SimTalonSRX"),
            "simVictorSPX": dict(deps=[], artifact_install_name="CTRE_SimVictorSPX"),
            "simProCANrange": dict(deps=[], artifact_install_name="CTRE_SimProCANrange"),
            "cci-sim": dict(
                deps=["tools-sim"], artifact_install_name="CTRE_PhoenixCCISim"
            ),
            "tools-sim": dict(
                deps=sim_install_name_classes,
                artifact_install_name="CTRE_PhoenixTools_Sim",
            ),
            "wpiapi-cpp-sim": dict(
                deps=[
                    "tools-sim",
                    allwpilib_dependency.container.get_cc_dependency("wpilibc-cpp"),
                ],
                artifact_install_name="CTRE_Phoenix6_WPISim",
            ),
        },
    )
    group.add_module_dependency(allwpilib_dependency)

    group.add_cc_meta_dependency(
        "phoenix6-hal",
        deps=[],
        platform_deps={
            "@rules_bzlmodrio_toolchains//constraints/is_roborio:roborio": [
                "tools",
            ],
            "//conditions:default": [
                "simCANCoder",
                "simPigeonIMU",
                "simProCANcoder",
                "simProCANrange",
                "simProPigeon2",
                "simProTalonFX",
                "simTalonSRX",
                "simVictorSPX",
                "tools-sim",
            ],
        },
        jni_deps={
            "@rules_bzlmodrio_toolchains//constraints/is_roborio:roborio": [
                "tools",
            ],
            "//conditions:default": [
                "api-cpp-sim",
                "simCANCoder",
                "simPigeonIMU",
                "simProCANcoder",
                "simProCANrange",
                "simProPigeon2",
                "simProTalonFX",
                "simTalonSRX",
                "simVictorSPX",
                "tools-sim",
            ],
        },
    )

    group.add_cc_meta_dependency(
        "phoenix6-cpp",
        deps=[
            "phoenix6-hal",
            "wpilibc-cpp",
        ],
        platform_deps={
            "@rules_bzlmodrio_toolchains//constraints/is_roborio:roborio": [
                "wpiapi-cpp",
            ],
            "//conditions:default": [
                "wpiapi-cpp-sim",
            ],
        },
        jni_deps={},
    )

    group.add_java_meta_dependency(
        "wpiapi-java",
        group_id=f"com.ctre.phoenix6",
        deps=["wpilibj-java", "phoenix6-hal"],
    )

    return group
