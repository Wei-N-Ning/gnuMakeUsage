#!/usr/bin/env bash

setUp() {
    set -e
}

testDeclaration() {
    make -f ifDeclAndFuncs.mk
    make -f ifDeclAndFuncs.mk print_abi
    make SOME_VAR=1 -f ifDeclAndFuncs.mk print_abi
}

setUp
testDeclaration
