#!/bin/bash
# Copyright 2019 Google Inc. All Rights Reserved
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS-IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The script generates the open source artifacts for JsInterop Annotations and
# uploads them to sonatype.
set -euo pipefail

source "$(dirname "$0")/deploy.sh"

readonly MAVEN_ARTIFACT="jsinterop-annotations"
readonly BAZEL_ARTIFACT="annotations"
readonly BAZEL_PATH="java/jsinterop/annotations"
readonly COPY_SRCS_IN_JAR=false

usage() {
    echo ""
    echo "$(basename $0): Build and deploy script for Jsinterop Annotations."
    echo ""
    echo "$(basename $0) --version <version> [--no-deploy]"
    echo "    --help"
    echo "        Print this help output and exit."
    echo "    --version <version>"
    echo "        Maven version of the library to use for deploying to sonatype."
    echo "    --no-deploy"
    echo "        Skip the deployment part but build all artifacts."
    echo "    --sonatype-auto-publish"
    echo "        Publish automatically the artifact on sonatype."
    echo ""
}

parse_arguments() {
  deploy_to_sonatype=true
  lib_version=""
  sonatype_auto_publish=false

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --version )
        shift
        lib_version=$1
        ;;
      --no-deploy )
        deploy_to_sonatype=false
        ;;
      --help )
        usage
        exit 0
        ;;
      --sonatype-auto-publish)
        sonatype_auto_publish=true
        ;;
      * )
        common::error "unexpected option $1"
        ;;
    esac
    shift
  done
}

main() {
  parse_arguments "$@"

  common::check_version_set
  common::check_bazel_prerequisites
  common::check_maven_prerequisites

  common::build
  common::deploy_to_sonatype
}

# Set the trap to cleanup temporary files on EXIT
trap common::cleanup_temp_files EXIT

main "$@"
