#!/usr/bin/env bash

function build() {
    ! $( make SOME_VERSION -f defensive.mk >/dev/null 2>&1 ) &&\
    echo "should fail"
    
    ! $( make -f defensive.mk >/dev/null 2>&1 ) &&\
    echo "should fail too"
}

build

