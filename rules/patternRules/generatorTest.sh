#!/usr/bin/env bash

function setUp() {
    rm -rf /tmp/_build
    mkdir /tmp/_build
    for fileName in one two three
    do
        dd if=/dev/zero of=/tmp/_build/${fileName}.pp bs=16 count=4 2>/dev/null 1>/dev/null
    done
}

function build() {
    make -s -f generator.mk
}

function clean() {
    make -s -f generator.mk clean
}

function verifyBuild() {
    ls /tmp/_build/*.bb | wc -l
}

clean
setUp
build
verifyBuild
clean
