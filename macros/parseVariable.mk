
# $(call F_ext_tmp,<VAR>)
# parses the words in _tmp, searching for <VAR>=<value>
# if found, sets (or creates) the <VAR> make variable to 
# <value> that follows
F_ext_tmp = \
	$(eval override $(1) = \
		$(patsubst $(1)=%,%,\
			$(filter $(1)=%,$(value _tmp)) \
		) \
	) \
	$(eval override $(1) := $$(value $(1)))


# use case:
# call a program and parse its return value:
# override _tmp := $(shell some_program)
# $(call F_ext_tmp,SOMEVAR)
override _tmp ?= DOOM=1993 DUNE2=1992
$(call F_ext_tmp,DOOM)
$(call F_ext_tmp,DUNE2)
$(call F_ext_tmp,DUKE)


__:
	@echo $(DOOM) $(DUNE2) $(DUKE)

