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

# Re-import only the output jar, dropping all transitive dependencies in the
# process. This is important for JsInterop Annotations as these are used by
# the J2CL-emulated JRE itself and thus cannot have any dependencies outside of
# toolchain's bootclasspath.
java_import(
    name = "annotations-j2cl_jar",
    jars = [":libannotations.jar"],
    tags = ["incomplete-deps"],
    # Grant access to J2CL JRE to include it in the bootclasspath which is a java_library.
    visibility = ["@com_google_j2cl//third_party:__pkg__"],
)

j2cl_import(
    name = "annotations-j2cl",
    jar = ":annotations-j2cl_jar",
)
