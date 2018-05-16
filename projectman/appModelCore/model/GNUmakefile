
override CFLAGS := $(CFLAGS) -c -Wall
INCLUDE_FLAGS := -I../core

model.o: %.o: %.c
	gcc $(INCLUDE_FLAGS) $(CFLAGS) -o $(@) $(<)

.PHONY: clean
clean:
	rm -f *.o

