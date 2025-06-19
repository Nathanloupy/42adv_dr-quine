# Makefile for Colleen

CC = cc
CCFLAGS = -Wall -Wextra -Werror

NAME = Colleen

FILES = Colleen.c

OBJS = $(FILES:.c=.o)

%.o: %.c
	@$(CC) $(CCFLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	@$(CC) $(CCFLAGS) $(OBJS) -o $(NAME)

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)

re: fclean all

run: all
	@./$(NAME)

.PHONY: all clean fclean re run