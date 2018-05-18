
LINE_COUNT := /tmp/_lc
BLOCK_FILE := /tmp/_bf

all: $(LINE_COUNT) $(BLOCK_FILE)

$(LINE_COUNT): $(INPUT)
	wc -l $(^) | cut -d " " -f 1 > $(@)

$(BLOCK_FILE): $(LINE_COUNT)
	dd if=$(^) of=$(@) bs=1 count=4

.PHONY: clean
clean:
	rm -f $(LINE_COUNT) $(BLOCK_FILE)
