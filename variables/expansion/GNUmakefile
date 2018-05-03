
# define a shell command to be executed (note the double dollar sign)
DF = df
AWK = awk
free-space := $(DF) . | $(AWK) 'NR == 2 { print $$4 }'

# simple variable is expanded immediately
MAKE_DEPEND := $(CC) -M
NOT_WORKING := $(XX) -M

__:
	$(free-space)
	echo $(MAKE_DEPEND)
	echo $(NOT_WORKING)



