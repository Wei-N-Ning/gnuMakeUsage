define callApp
/usr/bin/env python -c "import os;print(os.environ['HOME'])"
endef

ifeq ($(shell uname), FreeBSD)
CC := cc
else
CC := gcc
endif

define nullApp
/usr/bin/env bash -c "printf 'null\n'"
endef

__:
    # conditional expansion
	@echo $(if $(iddqd),inv,off)
	
    # conditional macro evaluation
	$(if $(iddqd),$(callApp),$(nullApp))

	@echo $(CC)
