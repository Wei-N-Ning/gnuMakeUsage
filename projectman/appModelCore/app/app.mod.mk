
# template
APP_SRCS := app/main.c
APP_C_SRCS := app/main.c
APP_OBJS := $(APP_C_SRCS:.c=.o)
APP_EXE := main

# add to top level variables
OBJS := $(APP_OBJS) $(OBJS)
EXE := $(APP_EXE) $(EXE)

# to export; to be used by other targets
# n/a

# flags
APP_CFLAGS := -c -I$(MODEL_INCLUDE_DIR)
APP_LINKFLAGS := $(MODEL_LINK_FLAGS)

$(APP_OBJS): $(APP_SRCS)
	$(CC) $(APP_CFLAGS) -o $(@) $(APP_C_SRCS)

$(APP_EXE): $(APP_OBJS) $(MODEL_SHLIB)
	$(CC) -o $(@) $(APP_OBJS) $(APP_LINKFLAGS)