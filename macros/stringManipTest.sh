#!/usr/bin/env bash

function setUp() {
    make -s -f stringManip.mk ShowInputs
}

function build() {
    make -s -f stringManip.mk PatternSub
    make -s -f stringManip.mk VariableSub
}

function tearDown() {
    :
}

function verifyBuild() {
    :
}

setUp
build
verifyBuild
tearDown
