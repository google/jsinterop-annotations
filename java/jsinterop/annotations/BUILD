# Description:
#   Jsinterop Annotations for J2CL/GWT
#

load("@google_bazel_common//tools/javadoc:javadoc.bzl", "javadoc_library")
load("@rules_java//java:defs.bzl", "java_library")

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
