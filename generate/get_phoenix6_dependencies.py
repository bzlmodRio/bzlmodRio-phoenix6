import os

from bazelrio_gentool.load_vendordep_dependency import vendordep_dependency
from get_allwpilib_dependencies import get_allwpilib_dependencies
from bazelrio_gentool.deps.dependency_container import (
    ModuleDependency,
)


def get_phoenix6_dependencies(
    use_local_allwpilib=False,
    use_local_opencv=False,
    use_local_ni=True,
    allwpilib_version_override="2023.3.2",
    opencv_version_override="4.6.0-4",
    ni_version_override="2023.3.0",
):
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
        year=2023,
        fail_on_hash_miss=False,
        has_static_libraries=False,
    )
    group.add_module_dependency(allwpilib_dependency)

    
    group.add_cc_meta_dependency(
        "phoenix6-cpp",
        deps=[
            "simCANCoder",
            "simPigeonIMU",
            "simProCANcoder",
            "simProPigeon2",
            "simProTalonFX",
            "simTalonFX",
            "simTalonSRX",
            "simVictorSPX",
            "tools",
            "tools-sim",
            "wpiapi-cpp",
            "wpiapi-cpp-sim",
            "wpilibc-cpp",
        ],
        platform_deps={},
        jni_deps={
            # TODO
        },
    )
    
    
    
    group.add_java_meta_dependency(
        "phoenix6-java",
        group_id=f"com.ctre.phoenix6",
        deps=[
            "wpilibj-java",
        ],
    )
    
    
    return group