#!/usr/bin/env bash

function build() {
    # using the default value hardcoded in the make file
    make -s -f overrideEnvVar.mk

    # using the value passed from the command line AND the default value; this can be useful when composing compiler flags
    make -s -f overrideEnvVar.mk -e DOOM=1993
}

build

