#!/bin/bash

echo "run test of configure"

chmod +x configure

./configure --cmakedir test --build build/mytest
build/mytest/run_build.sh
build/mytest/hello
