
INCLUDE_FLAGS := -Imodel

object_core := core 
object_model := model

objects := $(object_core) $(object_model)

.PHONY: all $(objects) libmodel.so main
all: $(objects) libmodel.so main

libmodel.so: $(objects)
	gcc -shared -o $(@) model/model.o core/core.o

main: app/main.c libmodel.so
	gcc $(INCLUDE_FLAGS) app/main.c -o $(@) -Wl,-L. -Wl,-lmodel

$(objects):
	$(MAKE) --directory=core
	$(MAKE) --directory=model

.PHONY: clean
clean:
	$(MAKE) --directory=core clean
	$(MAKE) --directory=model clean
	rm -f *.so *.o main


