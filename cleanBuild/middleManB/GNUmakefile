CXX := g++
override CXXFLAGS := \
$(CXXFLAGS) \
-std=c++17 \
-shared \
-fPIC
INCLUDE_FLAG := -I../treasureV2
LINK_FLAG := -Wl,--whole-archive ../treasureV2/libtreasureV2.a

all: libmiddleManB.so

libmiddleManB.so: blackMart.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE_FLAG) $< -o $@ $(LINK_FLAG)

.PHONY: clean
clean:
	rm -f libmiddleManB.so

