
NEED_VERSION := 3.80

# $(call assert,condition,message)
define assert
  $(if $1,,$(error Assertion failed: $2))
endef

__:
	$(if $(filter $(NEED_VERSION),$(SOME_VERSION)),\
	,\
	$(error require version: $(NEED_VERSION)))


