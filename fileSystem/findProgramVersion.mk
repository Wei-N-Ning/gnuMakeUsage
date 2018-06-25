GVER := $(shell gcc --version | grep -Po '\d\.\d.\d+' | sort -u)

ifneq "$(GVER)" "5.0.0"
$(error version is not 5.0.0, current: $(GVER))
endif

.PHONY: __
__:
	@echo $(GVER)

