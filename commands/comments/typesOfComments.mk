
__:
    # some make comment that should not be parsed
	@echo
	# shell comment! parsed and displayed!
	@for d in a b c; \
	do \
		printf "$$d.pk3 "; \
	done
	@df -BM -h | \
	awk 'NR == 2 { print $$1, $$4 }'