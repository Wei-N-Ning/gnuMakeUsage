#!/usr/bin/env bash

function expectTarget() {
    make -s -f target.mk
}

function expectFirstPrerequisite() {
    make -s -f first_prerequisite.mk
}

function expectAllRerequisitesNewerThanTarget() {
    make -s -f all_newer_prerequisites.mk
}

expectTarget
expectFirstPrerequisite
expectAllRerequisitesNewerThanTarget
