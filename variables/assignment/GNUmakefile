
CC := gcc
outDir := /tmp/gmp
sutSrc := $(outDir)/_.c
sutBin := $(outDir)/_.o
override CFLAGS += -g -pg

__:
	rm -rf $(outDir)
	mkdir $(outDir)
	echo "\
#include <stdio.h>\n\
int main(void) {\n\
	printf(\"thereisacow\");\n\
	return 0;\n\
}" > $(sutSrc)
	$(CC) $(CFLAGS) -o $(sutBin) $(sutSrc)

