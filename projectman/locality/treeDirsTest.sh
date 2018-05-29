#!/usr/bin/env bash

function setUp() {
    buildDir=/tmp/_build
    mkPath=$( pwd )/treeDirs.mk
    rm -rf ${buildDir}
    mkdir ${buildDir}
    cd ${buildDir}
    set -e
}

function build() {
    make -f ${mkPath}
}

setUp
build

