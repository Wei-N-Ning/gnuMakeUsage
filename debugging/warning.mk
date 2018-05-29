# evaluated immediately
CC := $(warning define c compiler)gcc

# defer-evaluated 
DOOM_DIR = $(warning define var DOOM_DIR)/tmp/doom

$(warning define a target)all:
	$(CC) -fPIC -c -o /dev/null /dev/null >/dev/null 2>&1
	$(warning about to run shell command)
	echo $(DOOM_DIR)

