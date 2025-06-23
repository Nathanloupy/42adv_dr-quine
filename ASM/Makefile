# Makefile for dr-quine (ASM Version)

ASM = nasm
LD = ld

ASMFLAGS = -f elf64
LDFLAGS = -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2

COLLEEN_NAME = Colleen
GRACE_NAME = Grace

COLLEEN_FILE = Colleen.s
GRACE_FILE = Grace.s
GRACE_KID_FILE = Grace_kid.s

COLLEEN_OBJ = $(COLLEEN_FILE:.s=.o)
GRACE_OBJ = $(GRACE_FILE:.s=.o)

all: $(COLLEEN_NAME) $(GRACE_NAME) $(GRACE_KID_NAME)

%.o: %.s
	@$(ASM) $(ASMFLAGS) $< -o $@

$(COLLEEN_NAME): $(COLLEEN_OBJ)
	@$(LD) $(LDFLAGS) $< -o $@

$(GRACE_NAME): $(GRACE_OBJ)
	@$(LD) $(LDFLAGS) $< -o $@

clean:
	@rm -f $(COLLEEN_OBJ)
	@rm -f $(GRACE_OBJ)

fclean: clean
	@rm -f $(COLLEEN_NAME)
	@rm -f $(GRACE_NAME)
	@rm -f $(GRACE_KID_FILE)

re: fclean all

.PHONY: all clean fclean re