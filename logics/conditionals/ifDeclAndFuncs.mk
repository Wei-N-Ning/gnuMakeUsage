# this example shows that there are two types of
# if syntaxes, one used in a variable definition, one
# used inside a command
# for the second type, ifeq is not accepted
# one have to use $(if $(filter A,B),...,...) instead

ifeq ($(shell uname), Linux)
GNU_MAKE := yes
else
GNU_MAKE := no
endif

# found this from wt's code base
# but the make book uses no indentation (especially no tab-indent)
ifeq "$(SOME_VAR)" "1"
abi = gcc48
else
abi = undef
endif

__:
	@echo \
	$(if $(filter $(shell uname),Linux),\
		1 $(GNU_MAKE),\
		0 $(GNU_MAKE))


print_abi:
	@echo "abi: $(abi)"
