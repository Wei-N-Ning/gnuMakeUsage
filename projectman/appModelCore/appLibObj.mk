
CC := gcc
INCLUDE_FLAGS := -Imodel
LINK_FLAGS := -L. -lmodel

objects := core model
objfiles := model/model.o core/core.o
lib := libmodel.so
exe := main

.PHONY: all $(exe) $(lib) $(objects)
all: $(exe)

$(exe): app/main.c $(lib)
	$(CC) $(INCLUDE_FLAGS) -o $(@) $(^) $(LINK_FLAGS)

$(lib): $(objects)
	$(CC) -shared -fPIC -o $(@) $(objfiles)

$(objects):
	$(MAKE) --directory=core CFLAGS="-fPIC -fvisibility=hidden"
	$(MAKE) --directory=model CFLAGS="-fPIC"

.PHONY: clean
clean:
	for d in $(objects); \
	do \
		$(MAKE) --directory=$$d clean; \
	done
	rm -f $(lib) $(exe)
