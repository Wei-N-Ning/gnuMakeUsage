INCLUDE := -I ../include
override CXXFLAGS += -g -pg
CXX := clang
treasureV1.a: holyGrail.o goldEgg.o
	$(AR) $< $(@) 
holyGrail.o: holyGrail.cpp
	$(CXX) -c $(INCLUDE) -o $(@) $< 
goldEgg.o: goldEgg.cpp
	$(CXX) -c $(INCLUDE) -o $(@) $<
