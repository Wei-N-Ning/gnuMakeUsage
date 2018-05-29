
# source:
# Make book P157
# see also: 
# how to get a makefile directory path

CURRENT_DIR := $(shell pwd)

PROJECT_DIR := /work/project
PROJECT_SRC_DIR := $(PROJECT_DIR)/src

CURRENT_MAKEFILE := $(firstword $(MAKEFILE_LIST))
CURRENT_MAKEFILE_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

CURRENT_SRC_DIR := $(CURRENT_MAKEFILE_DIR)src

__:
	@echo "current dir:" $(CURRENT_DIR)
	@echo "this is the top-level dir:" $(PROJECT_DIR)
	@echo "everything is relative:" $(PROJECT_SRC_DIR)
	@echo "current makefile is:" $(CURRENT_MAKEFILE)
	@echo "this is the makefile dir:" $(CURRENT_MAKEFILE_DIR)
	@echo "everything is relative:" $(CURRENT_SRC_DIR)

