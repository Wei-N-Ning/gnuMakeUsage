#!/usr/bin/env bash

function build() {
    make -f genDepFile.mk
}

function verifyBuild() {
    # main.o: main.c something.h
    #
    # something.h:
    cat main.d
    ./main
}

function tearDown() {
    make -f genDepFile.mk clean
}

build
verifyBuild
tearDown
