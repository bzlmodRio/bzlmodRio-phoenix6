load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix6_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix6_wpiapi_java",
        artifact = "com.ctre.phoenix6:wpiapi-java:26.70.0-alpha-2",
        artifact_sha256 = "d97516d06370a60c730b9b6902e6eb6cc1061ab4d0eec1ffd2c587e02a842372",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

setup_bzlmodrio_phoenix6_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_java_dependencies,
)
