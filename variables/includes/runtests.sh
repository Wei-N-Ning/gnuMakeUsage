#!/usr/bin/env bash

outDir="/tmp/gmp"
defFile="/tmp/gmp/definitions.mk"

function setUp() {
    rm -rf ${outDir}
    mkdir ${outDir}
}

function createDefFile() {
    echo "FOO := 1" > ${defFile}
}

function doMake() {
    make 2>/dev/null
    printf $?
    make -I ${outDir}
    printf $?
}

setUp
createDefFile
doMake

