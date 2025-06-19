# Makefile for dr-quine (C Version)

CC = cc
CCFLAGS = -Wall -Wextra -Werror

COLLEEN_NAME = Colleen
GRACE_NAME = Grace

COLLEEN_FILE = Colleen.c
GRACE_FILE = Grace.c
GRACE_KID_FILE = Grace_kid.c

COLLEEN_OBJ = $(COLLEEN_FILE:.c=.o)
GRACE_OBJ = $(GRACE_FILE:.c=.o)

%.o: %.c
	@$(CC) $(CCFLAGS) -c $< -o $@

all: $(GRACE_NAME) $(COLLEEN_NAME)

$(COLLEEN_NAME): $(COLLEEN_OBJ)
	@$(CC) $(CCFLAGS) $(COLLEEN_OBJ) -o $(COLLEEN_NAME)

$(GRACE_NAME): $(GRACE_OBJ)
	@$(CC) $(CCFLAGS) $(GRACE_OBJ) -o $(GRACE_NAME)

clean:
	@rm -f $(GRACE_OBJ) $(COLLEEN_OBJ)

fclean: clean
	@rm -f $(GRACE_NAME) $(COLLEEN_NAME)
	@rm -f $(GRACE_KID_FILE)

re: fclean all

.PHONY: all clean fclean re