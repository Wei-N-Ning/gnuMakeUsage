#!/usr/bin/env bash

function assertSuccess() {
    if [ $? != 0 ]
    then
        echo "command failed"
        exit 1
    fi
}

make
assertSuccess
ls -l main
assertSuccess
make clean
assertSuccess

