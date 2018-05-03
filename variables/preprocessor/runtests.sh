#!/usr/bin/env bash

function varIsDefinedInEnv() {
    DOOM=1 make -s
}

function varIsDefinedInCmdline() {
    make DOOM=1 -s
}

varIsDefinedInEnv
varIsDefinedInCmdline

