#!/bin/bash

SOURCE_DIR=$(dirname $0)
BUILD_DIR=$(mktemp -d modern-cpp-docker-build-XXX)

cp -a $SOURCE_DIR/. $SOURCE_DIR/../setup/ArchLinux.sh $BUILD_DIR || exit $?

docker build -t nedrebo/modern-cpp:latest $BUILD_DIR  || exit $?

rm -r $BUILD_DIR || exit $?
