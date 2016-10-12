#!/bin/bash
# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

case "${ghprbTargetBranch:-}" in
release-1.0|release-1.1|release-1.2)
  echo "PR node e2e job disabled for legacy branches."
  exit 0
  ;;
esac
./test/e2e_node/jenkins/e2e-node-jenkins.sh ./test/e2e_node/jenkins/jenkins-pull.properties
