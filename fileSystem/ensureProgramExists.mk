NVCC := $(shell which nvcc)
ifeq "$(NVCC)" ""
$(error can not find nvcc)
endif

__:
	@$(NVCC) --version

