
override CFLAGS := $(CFLAGS) -Wall
INCLUDE_FLAGS := -I../core -I../model
OBJECTS := ../core/core.o ../model/model.o

main: main.c
	gcc $(INCLUDE_FLAGS) $(CFLAGS) -o $(@) $(<) $(OBJECTS)

.PHONY: clean
clean:
	rm -f main

