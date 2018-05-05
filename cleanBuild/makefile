
BUILD_DIR := build
VPATH := treasureV1/src treasureV1/include
CXX := g++
override CXXFLAGS += -g -pg

build/treasureV1.o: goldEgg.cpp holyGrail.cpp
	$(CXX) $(CXXFLAGS) -o build/treasureV1.o $<

