#!/usr/bin/env bash

function cleanUp() {
    rm -f *.o
}

function suffixRule_expectObjectFilesGenerated() {
    cleanUp
    make -s -f suffixRules.mk
    if ! ( ls *.o )
    then
        echo "fail to generate object files"
        exit 1
    fi
}

suffixRule_expectObjectFilesGenerated

cleanUp
