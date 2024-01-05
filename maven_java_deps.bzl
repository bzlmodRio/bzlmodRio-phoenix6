load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix6_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix6_wpiapi_java",
        artifact = "com.ctre.phoenix6:wpiapi-java:24.0.0-beta-8",
        artifact_sha256 = "b8f1e3aafdda9f90b216ce173b9cde0d403ecbb51cb4c73a86d9c544b7d766a1",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

def setup_legacy_bzlmodrio_phoenix6_java_dependencies():
    __setup_bzlmodrio_phoenix6_java_dependencies(None)

setup_bzlmodrio_phoenix6_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_java_dependencies,
)
