#!/usr/bin/env bash

function clean() {
    make -s -f collectFiles.mk clean
}

function build() {
    make -s -f collectFiles.mk > /tmp/_
}

function verifyBuild() {
    wc -l /tmp/_
}

clean
build
verifyBuild
clean
