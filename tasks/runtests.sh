#!/usr/bin/env bash

# inspired by
# youtube: Make - Episode 2 - Basics
# model a simple file processing pipeline

function build() {
    if ! ( ls /tmp/_ 2>&1 1>/dev/null )
    then
        ls /tmp > /tmp/_
    fi
    make -f pipeline.mk INPUT=/tmp/_
}

function clean() {
    make -f pipeline.mk clean
}

function verifyBuild() {
    if ! ( ls /tmp/_lc && ls /tmp/_bf )
    then
        echo "fail to build"
        exit 1
    fi
}

clean
build
verifyBuild
build
clean
