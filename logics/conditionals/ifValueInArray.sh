#!/usr/bin/env bash

setUp() {
    set -e
}

runTests() {
    make -f ifValueInArray.mk
    make -f ifValueInArray.mk title=dune2
}

setUp
runTests

