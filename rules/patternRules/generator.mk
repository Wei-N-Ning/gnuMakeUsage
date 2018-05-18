
CP := cp

SRC_FILES := one.pp two.pp three.pp
BIN_DIR := /tmp/_build
BIN_FILES := $(subst .pp,.bb,$(SRC_FILES))

vpath %.pp /tmp/_build

all: $(BIN_FILES)

%.bb: %.pp
	cp $(^) $(BIN_DIR)/$(@)

clean:
	rm -f $(BIN_FILES)

