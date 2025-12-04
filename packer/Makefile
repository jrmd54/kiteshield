CFLAGS_COMMON = -Wall -Werror -Wno-error=array-bounds -Wno-error=dangling-pointer -Wno-error=sizeof-pointer-memaccess -std=gnu99 -I .. -I bddisasm/inc
CFLAGS = $(CFLAGS_COMMON) -O2 -Wno-error=array-bounds

LDFLAGS = -Lbddisasm/bin/x64/Release -l:libbddisasm.a

SRCS = $(wildcard *.c ../common/*.c ../loader/*.c)
OBJS = $(addprefix ./obj/, $(notdir $(SRCS:.c=.o)))
BIN_NAME = kiteshield

.PHONY: all debug debug-antidebug output-dirs clean

debug: CFLAGS = $(CFLAGS_COMMON) -g -DDEBUG_OUTPUT -DNO_ANTIDEBUG
debug-antidebug: CFLAGS = $(CFLAGS_COMMON) -g -DDEBUG_OUTPUT

all: output-dirs $(OBJS)
	$(CC) $(OBJS) -o $(BIN_NAME) $(LDFLAGS)

debug: all
debug-antidebug: all

output-dirs:
	mkdir -p obj

obj/%.o: ../loader/%.c
	$(CC) $(CFLAGS) -c $< -o $@

obj/%.o: ../common/%.c
	$(CC) $(CFLAGS) -c $< -o $@

obj/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(BIN_NAME)
	rm -rf obj/
