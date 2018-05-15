CXX := g++
override CXXFLAGS := \
$(CXXFLAGS) \
-std=c++17 \
-shared \
-fPIC
INCLUDE_FLAG := -I../treasureV1
LINK_FLAG := -Wl,--whole-archive ../treasureV1/libtreasureV1.a

all: libmiddleManA.so

libmiddleManA.so: store.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE_FLAG) $< -o $@ $(LINK_FLAG)

.PHONY: clean
clean:
	rm -f libmiddleManA.so

