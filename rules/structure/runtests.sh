#!/usr/bin/env bash

function setUp() {
    make -s clean
}

function tearDown() {
    make -s clean
}

function doMake() {
    make -n CFLAGS="-g -fPIC -Wall"
    make -s all
}

function dumpRuleDatabase() {
    make --print-data-base --question no-such-target 2>/dev/null | \
    grep -v -e '^no-such-target' -e '^GNUmakefile' | \
    awk '
/^[^.%][-A-Za-z0-9_]*:/ {
    print substr($1, 1, length($1) - 1)
}
'
}

setUp
doMake
dumpRuleDatabase
tearDown

