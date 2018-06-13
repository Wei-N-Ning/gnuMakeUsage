#!/usr/bin/env bash

setUp() {
    set -e
}

test_sort() {
    local l="asd bad 12 x12"
    make -f stringList.mk ARG1="${l}" SORT
}

test_index() {
    local l="asd bsd 12 0x12"
    make -f stringList.mk ARG1="${l}" ARG2=2 INDEX
    make -f stringList.mk ARG1="${l}" ARG2=10 INDEX
}

test_slice() {
    local l="a b c d e f g"
    make -f stringList.mk ARG1="${l}" ARG2=2 ARG3=5 SLICE
}

test_is_in() {
    local l="a b cd ef g"
    make -f stringList.mk ARG1="cd" ARG2="${l}" IS_IN
    make -f stringList.mk ARG1="kknd" ARG2="${l}" IS_IN
}

runTests() {
    test_sort
    test_index
    test_slice
    test_is_in
}

setUp
runTests
