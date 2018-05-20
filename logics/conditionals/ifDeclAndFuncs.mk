

ifeq ($(shell uname), Linux)
    GNU_MAKE := yes
else
    GNU_MAKE := no
endif

__:
	@echo \
	$(if $(filter $(shell uname),Linux),\
		1 $(GNU_MAKE),\
		0 $(GNU_MAKE))
