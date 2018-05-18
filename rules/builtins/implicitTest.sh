#!/usr/bin/env bash

function setUp() {
    make -f implicit.mk clean
}

function build() {
    make -f implicit.mk
}

function verifyBuild() {
    ./app
}

function tearDown() {
    make -f implicit.mk clean
}

setUp
build
( verifyBuild ) && build
tearDown
