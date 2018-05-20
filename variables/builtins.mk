
# MAKEFLAGS is a builtin variable

override DOOM := $(DOOM) v1.02

__:
	@echo "make exe:" $(MAKE)
	@echo "make flags:" $(MAKEFLAGS)
	@echo "doom:" $(DOOM)
	@echo "make cmd goals:" $(MAKECMDGOALS)
