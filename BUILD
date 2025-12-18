# Description:
#   Jsinterop Annotations for J2CL/GWT
#

load("@bazel_skylib//rules:build_test.bzl", "build_test")
load("@rules_license//rules:license.bzl", "license")

package(
    default_applicable_licenses = [":license"],
    default_visibility = [
        "//third_party/java/jsinterop_annotations:__subpackages__",
        "@j2cl//:__subpackages__",
    ],
    licenses = ["notice"],
)

license(
    name = "license",
    package_name = "jsinterop_annotations",
)

exports_files(["LICENSE"])

build_test(
    name = "rule_test",
    targets = [
        ":jsinterop-annotations",
    ],
)

alias(
    name = "jsinterop-annotations",
    actual = "//java/jsinterop/annotations:annotations",
    tags = ["avoid_dep"],  # Use //third_party/java/jsinterop_annotations:jsinterop-annotations instead.
)
