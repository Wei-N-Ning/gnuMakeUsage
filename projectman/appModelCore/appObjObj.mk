objects := core model
exe := app

.PHONY: all $(exe) $(objects)
all: $(exe)
$(exe) $(objects):
	$(MAKE) --directory=$(@)

$(exe): $(objects)

.PHONY: clean
clean:
	for d in $(exe) $(objects); \
	do \
		$(MAKE) --directory=$$d clean; \
	done
