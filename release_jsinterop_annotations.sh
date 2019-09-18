#!/bin/bash -i
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
# upload them to sonatype.

set -e

lib_version=$1

if [ -z ${lib_version} ]; then
  echo "Please specify the lib version."
  exit 1;
fi

bazel_root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

deploy_target='@com_google_j2cl//:deploy'
group_id="com.google.jsinterop"
maven_artifact="jsinterop-annotations"

cd ${bazel_root}

# ask bazel to explicitly build both jar files
bazel build //java/jsinterop/annotations:libannotations.jar
bazel build //java/jsinterop/annotations:libannotations-src.jar

jar_file=${bazel_root}/bazel-bin/java/jsinterop/annotations/libannotations.jar
src_jar=${bazel_root}/bazel-bin/java/jsinterop/annotations/libannotations-src.jar
pom_template=${bazel_root}/maven/pom-annotations.xml

# we cannot run the script directly from Bazel because it doesn't allow interactive script
runcmd="$(mktemp /tmp/bazel-run.XXXXXX)"
bazel run --script_path="$runcmd" ${deploy_target} -- \
    --artifact ${maven_artifact} \
    --jar-file ${jar_file} \
    --src-jar ${src_jar} \
    --pom-template ${pom_template} \
    --lib-version ${lib_version} \
    --group-id ${group_id} \
    --no-merge-src

"$runcmd"

rm "$runcmd"
