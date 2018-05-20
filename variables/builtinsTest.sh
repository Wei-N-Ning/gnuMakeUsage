#!/usr/bin/env bash

function build() {
    make -f builtins.mk DOOM=1 DUNE=2
}

build
