
IS_NUMBER = $(shell perl -e '"$(1)" =~ /^\d+$$/ and print 1')

IS_NUMBER_TEST:
	@echo $(call IS_NUMBER,231_23)
	@echo $(call IS_NUMBER,23123)
	@echo $(call IS_NUMBER,)
	@echo $(call IS_NUMBER,10)
	@echo $(call IS_NUMBER,-10)
	@echo $(call IS_NUMBER,0)
