__:
	@echo $(filter is, "there is a cow")
	@echo $(filter-out is, "there is a cow")
	@echo $(findstring /strings, $(PWD))
	@echo $(subst /strings,/cstrings,$(PWD))
	@echo $(words $(.VARIABLES))
	@echo $(word 100, $(.VARIABLES))
	@echo $(sort "1 there x1 is 23 12")
