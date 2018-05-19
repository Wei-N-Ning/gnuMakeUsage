
# template
MODEL_SRCS := model/model.c model/model.h
MODEL_C_SRCS := model/model.c
MODEL_OBJS := $(MODEL_C_SRCS:.c=.o)
MODEL_SHLIB := libmodel.so

# add to top level variables
OBJS := $(MODEL_OBJS) $(OBJS)
SHLIBS := $(SHLIBS) $(MODEL_SHLIB)

# to export; to be used by other targets
MODEL_INCLUDE_DIR := model
MODEL_LINK_FLAGS := -Wl,-L. -Wl,-lmodel

# flags
MODEL_CFLAGS := -fPIC -c -I$(CORE_INCLUDE_DIR) -I$(MODEL_INCLUDE_DIR)

$(MODEL_OBJS): $(MODEL_SRCS)
	$(CC) $(MODEL_CFLAGS) -o $(@) $(MODEL_C_SRCS)

$(MODEL_SHLIB):  $(MODEL_OBJS) $(CORE_OBJS)
	$(CC) -shared -o $(@) $(^)
