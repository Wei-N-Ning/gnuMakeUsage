
# $(call F_miss,<DIR>)
# the result is <DIR> if <DIR> does not exist
# or empty if otherwise
# if there are multiple directories in <DIR> the
# result is the names of the ones that are missing
F_miss = $(strip \
	$(foreach F,$1,\
		$(if $(wildcard $F),\
			,\
			$F\
		)\
	)\
)

__:
	@echo $(call F_miss,/tmp/$(TARGET))

