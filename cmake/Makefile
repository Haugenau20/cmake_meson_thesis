CC=gcc
OPT=-O0

BINARY := bin
BUILD_DIR := ./build
SRC_DIRS := ./src
LIB_DIR := ./lib

# Find all .c files in SRC_DIRS
SRCS := $(wildcard $(SRC_DIRS)/*.c)
# Make corresponding objects files for all the .c files 
OBJS := $(SRCS:.c=.o)
# Make corresponding dependency files from all the .c files 
DEPS := $(SRCS:.c=.d)

INC_DIRS := $(wildcard $(LIB_DIR))

# automatically add the -I onto each include directory
CFLAGS := -Wall -Wextra -g $(OPT)
DEPFLAGS =-MT $@ -MMD -MP -MF $(BUILD_DIR)
# generate files that encode make rules for the .h dependencies
CPPFLAGS = $(DEPFLAGS) $(addprefix -I,$(INC_DIRS))
all: $(BUILD_DIR) $(BUILD_DIR)/$(BINARY) 

$(BUILD_DIR)/$(BINARY): $(OBJS)
	$(CC) -o $@ $^

# only want the .c file dependency here, thus $< instead of $^.
%.o: %.c %.d
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^ -o


$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm $(BUILD_DIR)/* $(OBJS) $(DEPS)
	rmdir $(BUILD_DIR)

include $(wildcard $(DEPS))

.PHONY: all clean