#!/usr/bin/env bash

function testAll() {
    make -s -f GNUmakefile
}

function testWordlist() {
    make -s -f wordlist.mk
}

function testFilter() {
    make -s -f filter.mk
}

testAll
testWordlist
testFilter

