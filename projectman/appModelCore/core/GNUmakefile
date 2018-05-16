
override CFLAGS := $(CFLAGS) -c -Wall

core.o: %.o: %.c
	gcc $(CFLAGS) -o $(@) $(<)

.PHONY: clean
clean:
	rm -f *.o

