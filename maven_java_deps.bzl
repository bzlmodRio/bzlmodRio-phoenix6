load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix6_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix6_wpiapi_java",
        artifact = "com.ctre.phoenix6:wpiapi-java:26.3.0",
        artifact_sha256 = "95936310383bd9406d2dd6f901fed66bbfb5b5287e7cfd1c36c06abb7127f1e2",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

setup_bzlmodrio_phoenix6_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_java_dependencies,
)
