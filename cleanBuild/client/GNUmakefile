CXX := g++
override CXXFLAGS := \
$(CXXFLAGS) \
-std=c++17
INCLUDE_FLAG := -I../middleManA -I../middleManB
LINK_FLAG := -L../middleManA -lmiddleManA -L../middleManB -lmiddleManB

all: client

client: main.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE_FLAG) $< -o $@ $(LINK_FLAG)

.PHONY: clean
clean:
	rm -f client
