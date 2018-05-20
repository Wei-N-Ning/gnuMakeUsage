
INPUTS := model.in dds.in sparser.in
PATSUBST := $(patsubst %.in,%.c,$(INPUTS))

# source:
# youtube
# introduction to make and gnu autotools - Barry Smith 15:41
VARSUB := $(INPUTS:.in=.ddqd)

# source:
# wkou makefile
# extract the dso version from a name-version pattern
# see also:
# https://stackoverflow.com/questions/9551416/gnu-make-how-to-join-list-and-separate-it-with-separator
DOOM_VER_TAG := DOOM-1.11.23
_space_ :=
_space_ := $(_space_) $(_space_)
DOOM_DSO_VER := $(subst $(_space_),.,\
$(wordlist 1,2,\
$(subst ., ,\
$(subst -, ,$(DOOM_VER_TAG)))))

VARIABLES :=  asd 2 some  e 13 1
VARIABLES_JOINED := $(subst $(_space_),.,$(strip $(VARIABLES)))

ShowInputs:
	@echo $(INPUTS)

PatternSub:
	@echo $(PATSUBST)

VariableSub:
	@echo $(VARSUB)

JoinStrings:
	@echo $(subst $(_space_),.,a b c d)

StripJoinStrings:
	@echo $(VARIABLES_JOINED)

DoomMaVer:
	@echo $(DOOM_DSO_VER)

