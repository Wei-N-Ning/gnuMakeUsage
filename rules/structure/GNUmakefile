# gnu make proj 3rd P27, rule structure

COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
CC = clang
OUTPUT_OPTION = -o $@

%.o: %.c
	$(COMPILE.c) $(OUTPUT_OPTION) $<

all: model.o view.o

model.o: model.c
view.o: view.c

.PHONY: clean
clean:
	rm -f *.o
