CXX := g++
AR := ar
override CXXFLAGS := \
$(CXXFLAGS) \
-std=c++17 \
-c \
-fvisibility=hidden \
-fPIC

sources := goldEgg.cpp holyGrail.cpp
objects := $(subst .cpp,.o,$(sources))

all: $(objects) libtreasureV2.a

$(objects): %.o: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

libtreasureV2.a: $(objects)
	$(AR) rcs $(@) $(<)

.PHONY: clean
clean:
	rm -f $(objects) libtreasureV2.a
