#!/usr/bin/env bash

set -e

# _tmp is the default value
make -f ./parseVariable.mk

# set the value of _tmp
make _tmp="DUNE2=2001" -f ./parseVariable.mk
make _tmp="DUKE=1994" -f ./parseVariable.mk

