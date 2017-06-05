#!/bin/bash

cd $(dirname $0)

export CXX=clang++

for BUILD_TYPE in Debug Release
do
    mkdir -p build-$BUILD_TYPE && \
	cd build-$BUILD_TYPE && \
	cmake ../../.. -GNinja -DCMAKE_BUILD_TYPE=$BUILD_TYPE && \
	ninja && \
	cd - > /dev/null || \
	    exit $?
done

echo "Success!"
