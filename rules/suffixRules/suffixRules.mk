C++ := g++
sources := devar.cpp entity.cpp minimap.cpp sprite.cpp
objects := $(subst .cpp,.o,$(sources))

all: $(objects)

.cpp.o:
	$(C++) -c $(CPPFLAGS) $<

.PHONY: clean
clean:
	rm -f $(objects)
