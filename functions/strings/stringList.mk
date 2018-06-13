
ARG1 ?=#
ARG2 ?=#
ARG3 ?=#
ARG4 ?=#

# arg1: space separated strings
SORT:
	@echo $(sort $(ARG1))

# arg1: space separated strings
# arg2: index
# if index is out of range, return empty string
# it does not valid the index
INDEX:
	@echo $(word $(ARG2),$(ARG1))

POP:
	@:

PUSH:
	@:

APPEND:
	@:

INSERT:
	@:

# ARG1: strings
# ARG2: start index
# ARG3: end index
SLICE:
	@echo $(wordlist $(ARG2),$(ARG3),$(ARG1))

# ARG1: a string as test subject
# ARG2: a list strings
IS_IN:
	@echo $(if $(filter $(ARG1),$(ARG2)),\
		in,\
		not-in\
	)

REVERSE:
	@:

CONCAT:
	@:

REMOVE_DUP:
	@:

UNION:
	@:

INTERSECT:
	@:


