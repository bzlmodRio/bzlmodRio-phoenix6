load("@rules_java//java:defs.bzl", "java_library")
load("@rules_wpi_styleguide//styleguide:java_styleguide.bzl", "java_styleguide")

java_library(
    name = "subsystems",
    srcs = glob(["*.java"]),
    javacopts = ["-Werror"],
    visibility = ["//visibility:public"],
    deps = [
        "@bzlmodrio-allwpilib//libraries/java/hal",
        "@bzlmodrio-allwpilib//libraries/java/wpilibNewCommands",
        "@bzlmodrio-allwpilib//libraries/java/wpilibj",
        "@bzlmodrio-allwpilib//libraries/java/wpimath",
        "@bzlmodrio-allwpilib//libraries/java/wpiunits",
        "@bzlmodrio-phoenix6//libraries/java/wpiapi-java",
    ],
)

java_styleguide(name = "subsystems")
