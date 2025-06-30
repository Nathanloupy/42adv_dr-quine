# Makefile for dr-quine (ASM Version)

ASM = nasm
LD = ld

ASMFLAGS = -f elf64 -g
LDFLAGS = -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2 -g

COLLEEN_NAME = Colleen
GRACE_NAME = Grace
SULLY_NAME = Sully

COLLEEN_FILE = Colleen.s
GRACE_FILE = Grace.s
GRACE_KID_FILE = Grace_kid.s
SULLY_FILE = Sully.s
SULLY_KID_FILES = Sully_*

COLLEEN_OBJ = $(COLLEEN_FILE:.s=.o)
GRACE_OBJ = $(GRACE_FILE:.s=.o)
SULLY_OBJ = $(SULLY_FILE:.s=.o)

all: $(COLLEEN_NAME) $(GRACE_NAME) $(SULLY_NAME)

%.o: %.s
	@$(ASM) $(ASMFLAGS) $< -o $@

$(COLLEEN_NAME): $(COLLEEN_OBJ)
	@$(LD) $(LDFLAGS) $< -o $@

$(GRACE_NAME): $(GRACE_OBJ)
	@$(LD) $(LDFLAGS) $< -o $@

$(SULLY_NAME): $(SULLY_OBJ)
	@$(LD) $(LDFLAGS) $< -o $@

clean:
	@rm -f $(COLLEEN_OBJ)
	@rm -f $(GRACE_OBJ)
	@rm -f $(SULLY_OBJ)
fclean: clean
	@rm -f $(COLLEEN_NAME)
	@rm -f $(GRACE_NAME)
	@rm -f $(GRACE_KID_FILE)
	@rm -f $(SULLY_NAME)
	@rm -f $(SULLY_KID_FILES)

re: fclean all

.PHONY: all clean fclean re