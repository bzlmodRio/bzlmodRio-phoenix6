load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix6_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix6_wpiapi_java",
        artifact = "com.ctre.phoenix6:wpiapi-java:25.3.0",
        artifact_sha256 = "d2e7899f66bb5552e72ffbacad8d3654cc2c5279d139050d7ee13dc4bc949aa4",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

def setup_legacy_bzlmodrio_phoenix6_java_dependencies():
    __setup_bzlmodrio_phoenix6_java_dependencies(None)

setup_bzlmodrio_phoenix6_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_java_dependencies,
)
