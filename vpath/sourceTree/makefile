# comment...
# showing:
# > how to use command line variable: OUT_DIR
# > how to define include path
# > how to set clean-up target

vpath %.cpp src
vpath %.hpp include

CPPFLAGS = -I include

main: main.cpp
	$(CXX) $(CPPFLAGS) $^ -o $(OUT_DIR)$@

.PHONY: clean
clean:
	@rm -f $(OUT_DIR)main src/*.o

