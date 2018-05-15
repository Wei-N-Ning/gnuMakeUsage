#!/usr/bin/env bash

make --directory=treasureV2
make --directory=middleManB
make --directory=treasureV1
make --directory=middleManA

make -s --directory=treasureV1 clean
make -s --directory=treasureV2 clean
make -s --directory=middleManA clean
make -s --directory=middleManB clean
