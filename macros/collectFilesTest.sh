#!/usr/bin/env bash

function clean() {
    make -s -f collectFiles.mk clean
}

function build() {
    make -s -f collectFiles.mk > /tmp/_
    make -s -f collectFiles.mk FilesWithExt
}

function verifyBuild() {
    wc -l /tmp/_
}

clean
build
verifyBuild
clean
