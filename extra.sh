#!/bin/bash

printf "== Installing helm plugins\n"
helm plugin install https://github.com/databus23/helm-diff
helm plugin install https://github.com/hypnoglow/helm-s3.git

printf "== Installing graalvm plugins\n"
xattr -r -d com.apple.quarantine ${GRAALVM_HOME}/../..
gu install native-image