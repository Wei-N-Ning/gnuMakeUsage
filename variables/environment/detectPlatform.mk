ifdef COMSPEC
  OUTPUT_ROOT := d:
  GCC_HOME := c:/gnu/usr/bin
else
  OUTPUT_ROOT := $(HOME)
  GCC_HOME := /usr/bin
endif

__:
	@echo $(OUTPUT_ROOT) $(GCC_HOME)
