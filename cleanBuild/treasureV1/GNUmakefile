CXX := g++

lib_treasureV1 := libtreasureV1.a

sources := goldEgg.cpp holyGrail.cpp
headers := $(subset .cpp,.hpp,$(sources))
dependencies := $(subset .cpp,.d,$(sources))

include_dirs := .
CPPFLAGS += $(addprefix -I ,$(include_dirs))
vpath %.h $(include_dirs)

$(lib_treasureV1): $(sources) $(headers)
	$(CXX) $(CPPFLAGS) -static -fPIC -o $(@) $^

.PHONY: clean
clean:
	$(RM) $(lib_treasureV1)

