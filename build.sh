#!/bin/bash

SLIDES="Distribution Documentation Test Project"
BUILD_DIR="build"

pushd $( dirname $0 )

mkdir -p ${BUILD_DIR}

for DIR in ${SLIDES}; do
    pushd "${DIR}"
    echo "Build ${DIR}"
    landslide --embed --destination=../${BUILD_DIR}/${DIR}.html index.rst
    popd
done

popd
