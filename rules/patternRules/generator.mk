
CP := cp

SRC_TREE := /tmp/_build
BUILD_TREE := /tmp/_build

SRC_FILES := one.pp two.pp three.pp
BIN_FILES := $(subst .pp,.bb,$(SRC_FILES))

vpath %.pp /tmp/_build

all: $(BIN_FILES)

%.bb: %.pp
	cp $(^) $(BUILD_TREE)/$(@)

clean:
	rm -f $(BIN_FILES)

