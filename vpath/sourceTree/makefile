vpath %.cpp src
vpath %.hpp include

CPPFLAGS = -I include

main: main.cpp
	$(CXX) $(CPPFLAGS) $^ -o $@

.PHONY: clean
clean:
	rm -f main src/*.o

