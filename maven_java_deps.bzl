load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix6_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix6_wpiapi_java",
        artifact = "com.ctre.phoenix6:wpiapi-java:25.0.0-beta-4",
        artifact_sha256 = "3d31734fef93a3c92076a6606dc31bb7d64b1af23f038ea2866aa18d99245bd7",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

def setup_legacy_bzlmodrio_phoenix6_java_dependencies():
    __setup_bzlmodrio_phoenix6_java_dependencies(None)

setup_bzlmodrio_phoenix6_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_java_dependencies,
)
