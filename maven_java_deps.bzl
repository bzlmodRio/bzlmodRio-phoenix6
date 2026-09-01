load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix6_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix6_wpiapi_java",
        artifact = "com.ctre.phoenix6:wpiapi-java:26.50.0-alpha-1",
        artifact_sha256 = "d54dce601e3d00fb4b3f67ddfd9a33cbdd2d1fc1fcbb1adcffe71b78706f0160",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

setup_bzlmodrio_phoenix6_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_java_dependencies,
)
