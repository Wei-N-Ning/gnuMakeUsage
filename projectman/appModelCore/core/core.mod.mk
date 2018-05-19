
# template
CORE_SRCS := core/core.c core/core.h
CORE_C_SRCS := core/core.c
CORE_OBJS := $(CORE_C_SRCS:.c=.o)

# add to top level variables
OBJS := $(CORE_OBJS) $(OBJS)

# to export; to be used by other targets
CORE_INCLUDE_DIR := core

# flags
CORE_CFLAGS := -c -fPIC

$(CORE_OBJS): $(CORE_SRCS)
	$(CC) $(CORE_CFLAGS) -o $(@) $(CORE_C_SRCS)
