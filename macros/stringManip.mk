
INPUTS := model.in dds.in sparser.in
PATSUBST := $(patsubst %.in,%.c,$(INPUTS))

# source:
# youtube
# introduction to make and gnu autotools - Barry Smith 15:41
VARSUB := $(INPUTS:.in=.ddqd)

ShowInputs:
	@echo $(INPUTS)

PatternSub:
	@echo $(PATSUBST)

VariableSub:
	@echo $(VARSUB)
