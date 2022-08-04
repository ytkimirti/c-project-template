NAME = sum


CFLAGS = -Wall -Wextra -Ilibft
LDFLAGS = -Llibft
LDLIBS = -lft

CC = gcc
SHELL = /bin/sh

SRC_DIR = src
OBJ_DIR = obj
TEST_DIR = tests

ENTRY_SRCS = src/main.c
SRCS = src/summer.c
TEST_SRCS = test/sum_test.c

ENTRY_OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(ENTRY_SRCS))
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))
TEST_BINS = $(patsubst $(TEST_DIR)/%.c, $(TEST_DIR)/bin/%, $(TEST_SRCS))

all: $(NAME)

$(NAME): $(OBJS) $(ENTRY_OBJS)
	$(CC) $(LDFLAGS) $(LDLIBS) $(OBJS) $(ENTRY_OBJS) -o $@

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

$(TEST_DIR)/bin:
	mkdir $(TEST_DIR)/bin

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(TEST_DIR)/bin
