# Description:
#   Jsinterop Annotations for J2CL/GWT
#

load("@com_google_j2cl//build_defs:rules.bzl", "j2cl_import")
load(":import_annotations_jar.bzl", "import_annotations_jar")
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

# Re-import only the output jar, dropping all transitive dependencies in the
# process. This is important for JsInterop Annotations as these are used by
# the J2CL-emulated JRE itself and thus cannot have any dependencies outside of
# toolchain's bootclasspath.
import_annotations_jar(
    name = "annotations_jar",
    jar = ":libannotations.jar",
    # No one outside of this package should _ever_ depend upon this target.
    visibility = ["//visibility:private"],
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
    jar = ":annotations_jar",
)
