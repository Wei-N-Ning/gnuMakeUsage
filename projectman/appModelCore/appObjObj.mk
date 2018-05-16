libcore := core
libmodel := model

.PHONY: all
all:
	$(MAKE) --directory=core
	$(MAKE) --directory=model
	$(MAKE) --directory=app

.PHONY: clean
clean:
	$(MAKE) --directory=core clean
	$(MAKE) --directory=model clean
	$(MAKE) --directory=app clean

