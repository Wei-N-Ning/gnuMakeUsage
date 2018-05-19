
# source
# youtube
# make and gnu autotools

CC := gcc
OUTPUT_OPTION = -MMD -MP

SOURCES := $(wildcard *.c)
OBJS := $(SOURCES:.c=.o)
DEPS := $(SOURCES:.c=.d)
EXE := main
-include $(DEPS)

$(EXE): $(OBJS)
	gcc -o $(@) $(^)

clean:
	rm -f $(OBJS) $(DEPS) $(EXE)
