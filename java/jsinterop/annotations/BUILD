# Description:
#   Jsinterop Annotations for J2CL/GWT
#

load("@com_google_j2cl//build_defs:rules.bzl", "j2cl_import")
load("@bazel_common_javadoc//:javadoc.bzl", "javadoc_library")

package(
    default_applicable_licenses = ["//:license"],
    default_visibility = ["//:__pkg__"],
)

licenses(["notice"])

java_library(
    name = "annotations",
    srcs = glob(["*.java"]),
)

javadoc_library(
    name = "annotations-javadoc",
    srcs = glob(["*.java"]),
    tags = [
        "manual",
        "notap",
    ],
)

j2cl_import(
    name = "annotations-j2cl",
    jar = ":annotations",
)
