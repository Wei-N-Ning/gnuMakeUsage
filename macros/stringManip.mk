
INPUTS := model.in dds.in sparser.in
PATSUBST := $(patsubst %.in,%.c,$(INPUTS))

ShowInputs:
	@echo $(INPUTS)

PatternSub:
	@echo $(PATSUBST)
