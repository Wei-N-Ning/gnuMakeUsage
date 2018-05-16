#!/usr/bin/env bash

# this case is similar to
# linuxBinaryAnalysis/gcc/symbolVis/appObj.sh
# the visibility attribute does not affect the
# end product - the executable

function build() {
    make -s -f appObjObj.mk
}

function clean() {
    make -s -f appObjObj.mk clean
}

function verifyBuild() {
    if ! ( app/main )
    then
        echo "fail to run main"
        exit 1
    fi
    readelf -s app/main | grep -i push
}

clean
build
verifyBuild
clean
