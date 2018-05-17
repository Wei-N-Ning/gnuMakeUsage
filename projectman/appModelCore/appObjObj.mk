objects := core model
exe := app

.PHONY: all $(exe) $(objects)
all: $(exe)
$(exe) $(objects):
	$(MAKE) --directory=$(@) $(TARGET)

$(exe): $(objects)

