# Makefile for dr-quine (ASM Version)

ASM = nasm
LD = ld

ASMFLAGS = -f elf64
LDFLAGS = -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2

COLLEEN_NAME = Colleen

COLLEEN_FILE = Colleen.s

COLLEEN_OBJ = $(COLLEEN_FILE:.s=.o)

all: $(COLLEEN_NAME)

%.o: %.s
	@$(ASM) $(ASMFLAGS) $< -o $@

$(COLLEEN_NAME): $(COLLEEN_OBJ)
	@$(LD) $(LDFLAGS) $< -o $@

clean:
	@rm -f $(COLLEEN_OBJ)

fclean: clean
	@rm -f $(COLLEEN_NAME)

re: fclean all

.PHONY: all clean fclean re