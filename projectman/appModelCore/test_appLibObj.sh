#!/usr/bin/env bash

# this case is similar to
# linuxBinaryAnalysis/gcc/symbolVis/appLibObj.sh

# the artifact is the shared library;
# it knows which symbols to export therefore
# when an end-user product is linked against
# it (main), the private symbols are stripped
# from the resulting binary; this is done
# without any extra compiler/linker flags

# the executable only contains the symbols
# exported from the business model

function build() {
    make -s -f appLibObj.mk
}

function clean() {
    make -s -f appLibObj.mk clean
}

function verifyBuild() {
    if ! ( LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:. ./main )
    then
        echo "fail to run main"
        exit 1
    fi
    readelf -s main | awk '
$8 ~ /^[^_]+/ && $5 ~ /GLOBAL/ {
    print
}
'
}

clean
build
verifyBuild
clean
