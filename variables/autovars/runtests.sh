#!/usr/bin/env bash

function expectTarget() {
    make -s -f target.mk
}

function expectFirstPrerequisite() {
    make -s -f first_prerequisite.mk
}

function expectAllPrerequisitesNewerThanTarget() {
    make -s -f all_newer_prerequisites.mk
}

function expectAllPrerequisitesNoDups() {
    make -s -f all_prerequisites.mk
}

function expectAllPrerequisitesWithDups() {
    make -s -f all_prerequisites_dups.mk
}

expectTarget
expectFirstPrerequisite
expectAllPrerequisitesNewerThanTarget
expectAllPrerequisitesNoDups
expectAllPrerequisitesWithDups
