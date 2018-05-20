#!/usr/bin/env bash

function build() {
    make -f detectPlatform.mk
}

build
