#!/usr/bin/env bash

function build() {
    # expect 1.0
    make -f defineIfNotEnv.mk

    export DOOM_VER="2.0"
    # use the value from the environment
    make -f defineIfNotEnv.mk
}

build
