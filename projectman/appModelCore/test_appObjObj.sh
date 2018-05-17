#!/usr/bin/env bash

# this case is similar to
# linuxBinaryAnalysis/gcc/symbolVis/appObj.sh
# the visibility attribute does not affect the
# end product - the executable still contains
# the private/implementation symbols

# they are marked "HIDDEN" but they STILL EXIST
# it even includes the libc symbols: strlen


# pollution alert!!


function build() {
    make -s -f appObjObj.mk CFLAGS="-fvisibility=hidden"
}

function clean() {
    make -s -f appObjObj.mk TARGET=clean
}

function verifyBuild() {
    if ! ( app/main )
    then
        echo "fail to run main"
        exit 1
    fi
    readelf -s app/main | awk '
$8 ~ /^[^_]+/ && $5 ~ /GLOBAL/ {
    print
}
'
}

clean
build
verifyBuild
clean
