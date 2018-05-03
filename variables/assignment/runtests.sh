#!/usr/bin/env bash

function run() {
    make CFLAGS=-std=c99 | awk '/gcc/ { print $0 }'
}

run

