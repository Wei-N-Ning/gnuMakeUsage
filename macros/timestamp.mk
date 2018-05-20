TIMESTAMP  := \
$(wordlist 1,1,\
$(subst :,_,\
$(shell date +"%Y-%m-%dT%X%z")))

__:
	@echo $(TIMESTAMP)
