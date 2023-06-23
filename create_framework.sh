#!/bin/bash -e

framework_name="Rustios"
library_name="librustios"
input_type=$1

if [ -z "${input_type}" ]; then
    echo "Error: No input type specified. Please specify '--release' or '--dev'."
    exit 1
fi

build_type="release"
if [ "${input_type}" = "--dev" ]; then
    build_type="debug"
elif [ "${input_type}" != "--release" ]; then
    echo "Error: Invalid input type specified. Please specify '--release' or '--dev'."
    exit 1
fi

mkdir -p build
rm -rf build/${build_type}/${framework_name}.xcframework

cp module.modulemap build/includes

xcodebuild -create-xcframework \
  -library target/aarch64-apple-ios/${build_type}/${library_name}.a \
  -headers build/includes \
  -library target/aarch64-apple-ios-sim/${build_type}/${library_name}.a\
  -headers build/includes \
  -output build/${build_type}/${framework_name}.xcframework
