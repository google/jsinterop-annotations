# Description:
#   Jsinterop Annotations for J2CL/GWT
#

load("@rules_license//rules:license.bzl", "license")
load("@bazel_skylib//rules:build_test.bzl", "build_test")
load("@com_google_j2cl//build_defs:rules.bzl", "j2cl_alias")

package(
    default_applicable_licenses = ["//:license"],
    default_visibility = ["//visibility:public"],
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
        ":jsinterop-annotations-j2cl",
    ],
)

alias(
    name = "jsinterop-annotations",
    actual = "//java/jsinterop/annotations:annotations",
)

j2cl_alias(
    name = "jsinterop-annotations-j2cl",
    actual = "//java/jsinterop/annotations:annotations-j2cl",
)
