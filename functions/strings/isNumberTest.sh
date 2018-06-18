#!/usr/bin/env bash

setUp() {
    set -e
    rm -rf /tmp/sut
    mkdir /tmp/sut
}

runTests() {
    for value in '' 231_23 23123 10 -10 0
    do
        echo -n "value=${value} , result="
        make -f ./isNumber.mk VALUE=${value}
    done
}

setUp
runTests
