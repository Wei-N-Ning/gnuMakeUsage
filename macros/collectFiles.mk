
TMP_FILES := $(shell ls /tmp/*.tmp)
MK_FILES := $(shell find .. -name "*.mk" -type f)

__:
	for filePath in $(TMP_FILES); \
	do \
		echo $$filePath; \
	done

	for filePath in $(MK_FILES); \
	do \
		echo $$filePath; \
	done

clean:
	:
