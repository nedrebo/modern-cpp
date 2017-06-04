#!/bin/bash

cd $(dirname $0)

export CXX=clang++

mkdir -p build && \
    cd build && \
    cmake ../.. -GNinja && \
    ninja || \
	exit $?

echo "Success!"
