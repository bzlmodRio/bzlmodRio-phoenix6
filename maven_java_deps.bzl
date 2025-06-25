load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def __setup_bzlmodrio_phoenix6_java_dependencies(mctx):
    jvm_maven_import_external(
        name = "com_ctre_phoenix6_wpiapi_java",
        artifact = "com.ctre.phoenix6:wpiapi-java:25.90.0-alpha-1",
        artifact_sha256 = "3ee7bda8b5bd776ca49ebd39ec3ecc0b957beae8bd70a422e49d7ec23b47c5e7",
        server_urls = ["https://maven.ctr-electronics.com/release"],
    )

def setup_legacy_bzlmodrio_phoenix6_java_dependencies():
    __setup_bzlmodrio_phoenix6_java_dependencies(None)

setup_bzlmodrio_phoenix6_java_dependencies = module_extension(
    __setup_bzlmodrio_phoenix6_java_dependencies,
)
