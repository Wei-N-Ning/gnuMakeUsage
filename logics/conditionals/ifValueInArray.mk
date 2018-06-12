
products = doom duke dune2

TOUCH = touch
STAT = stat

.PHONY: run_tests
run_tests:
ifneq ($(filter $(title),$(products)),)
	$(TOUCH) /tmp/$(title)
	$(STAT) /tmp/$(title)
else
	@echo "title not accepted"
endif

