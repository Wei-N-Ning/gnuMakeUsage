GCC_MAJOR_MINOR_VER := $(shell gcc --version | grep -Po '\d\.\d.\d+' | sort -u | grep -Po '^\d\.\d')


ifneq "$(GCC_MAJOR_MINOR_VER)" "5.0"
$(error version is not 5.0.x, current: $(GCC_MAJOR_MINOR_VER))
endif

.PHONY: __
__:
	@echo passed

