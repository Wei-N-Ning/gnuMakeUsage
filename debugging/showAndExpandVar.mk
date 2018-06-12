
ECHO = echo

F_show_var = \
@$(ECHO) \
'$(1)$(3)$(2)$(3)=$(if $(value $(2)), $(subst ','"'"',$(subst \,\\,$(value $(2)))),)'

F_expand_var = \
@$(ECHO) '$(1)$(3)$(2)$(3)=$(if $(value $(2)), $(subst ','"'"',$(subst \,\\,$($2))))'

DOOM = 1993
DUNE = 1992
PRODUCTS = $(DOOM) $(DUNE)

__:
	$(call F_show_var,there is a cow,DOOM, )
	$(call F_expand_var,there is no spoon,PRODUCTS, )

