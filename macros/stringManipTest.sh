#!/usr/bin/env bash

function setUp() {
    make -s -f stringManip.mk ShowInputs
}

function build() {
    make -s -f stringManip.mk PatternSub
    make -s -f stringManip.mk VariableSub
    make -s -f stringManip.mk JoinStrings
    make -s -f stringManip.mk DoomMaVer
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
