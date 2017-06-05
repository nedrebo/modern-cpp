#!/bin/bash

cd $(dirname $0)

build-Debug/tests/tests || exit $?

echo "Success!"
