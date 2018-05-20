#!/usr/bin/env bash

function build() {
    make -s -f wordlist.mk
}

build
