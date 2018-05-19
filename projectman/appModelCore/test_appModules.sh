#!/usr/bin/env bash

function setUp() {
    make -f appModules.mk clean
}

function build() {
    make -f appModules.mk
}

function verifyBuild() {
    ! ( ./main ) && ( echo "fail to run main"; exit 1 )
}

function tearDown() {
    make -f appModules.mk clean
}

setUp
build
verifyBuild
tearDown
