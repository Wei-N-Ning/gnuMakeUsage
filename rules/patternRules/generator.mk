
CP := cp

SRC_FILES := $(shell ls /tmp/_build/*.pp)
BIN_FILES := $(subst .pp,.bb,$(SRC_FILES))

all: $(BIN_FILES)

%.bb: %.pp
	cp $(^) $(@)

clean:
	rm -f $(BIN_FILES)

