
VPATH = src include
CFLAGS = -I include

main: envelope.o validator.o
	$(CC) $^ -o $@
envelope.o: include/envelope.h
	$(CC) -c -o $@
validator.o: include/validator.h
	$(CC) -c -o $@

.PHONY: clean
clean: 
	rm -f main *.o src/*.o

