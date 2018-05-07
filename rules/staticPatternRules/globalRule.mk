C++ := g++
sources := devar.cpp entity.cpp minimap.cpp sprite.cpp
objects := $(subst .cpp,.o,$(sources))

all: $(objects)

%.o: %.cpp
	$(C++) -c $(CPPFLAGS) $< -o $@

.PHONY: clean
clean:
	rm -f $(objects)
