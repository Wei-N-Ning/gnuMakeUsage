
IS_NUMBER = $(shell perl -e '"$(1)" =~ /^\d+$$/ and print 1')

__:
	@echo $(call IS_NUMBER,$(VALUE))
