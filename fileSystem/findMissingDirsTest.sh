#!/usr/bin/env bash

set -e
rm -rf /tmp/ab

make -f findMissingDirs.mk TARGET=lol
make -f findMissingDirs.mk TARGET=ab

mkdir -p /tmp/ab
make -f findMissingDirs.mk TARGET=ab


