GVER := "$(shell gcc --version | grep -Po '\d\.\d.\d+' | sort -u)"


.PHONY: __
__:
	@echo $(GVER)

