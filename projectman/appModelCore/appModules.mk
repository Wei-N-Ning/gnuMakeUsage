# take one step forward from appLibObj.mk, making
# each sub directory a module

RM := rm
CC := gcc

SHLIBS :=
STLIBS :=
OBJS :=
EXE :=
SRCS :=

# see Make book P119 (139) for the reason of defining
# an empty target like this
all:

# each module should define:
# MOD_SRCS
# MOD_C_SRCS or MOD_CXX_SRCS
# (only the .c/.cc/.cpp files, not including the headers)
# MOD_OBJS
#
# can optionally define:
# MOD_STLIB
# MOD_SHLIB
# MOD_EXE
#
# and export them via:
# MOD_LINK_FLAGS
# MOD_INCLUDE_DIR
#
# Note the order of calling include must follow the
# order of logical dependency

include core/core.mod.mk
include model/model.mod.mk
include app/app.mod.mk

all: $(EXE)

clean:
	$(RM) -f $(SHLIBS) $(STLIBS) $(OBJS) $(EXE)
