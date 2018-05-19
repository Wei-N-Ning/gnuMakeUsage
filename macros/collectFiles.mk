
TMP_FILES := $(shell ls /tmp/*.tmp)
MK_FILES := $(shell find .. -name "*.mk" -type f)

# source:
# youtube
# make and gnu autotools
FILESWITHEXT := $(wildcard *.mk)

__:
	for filePath in $(TMP_FILES); \
	do \
		echo $$filePath; \
	done

	for filePath in $(MK_FILES); \
	do \
		echo $$filePath; \
	done

FilesWithExt:
	@echo $(FILESWITHEXT)

clean:
	:
