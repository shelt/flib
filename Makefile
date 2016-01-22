# COMPILATION OPTIONS
CC = csc
CFLAGS = 
BIN_PREFIX = autocracy-

# FOLDERS
ROOT  = $(shell pwd)
L_DIR = lib
O_DIR = build
B_DIR = bin
S_DIR = src

UNITS = $(patsubst %.scm,%.o,$(shell cd $(S_DIR) && find units -name '*.scm'))
EGGS  = $(sort $(dir $(wildcard lib/*/)))

# BUILD TARGETS
TARGETS = release testing
release_REQS = targets/main.o $(UNITS)
testing_REQS = targets/testing.o $(UNITS)

# GENERIC RULES
default: all
all: init $(TARGETS)


############
## STATIC ##
############

# See "Secondary Expansion"
.SECONDEXPANSION:
 
#%.a:; TODO needed?

# Generate object file
$(O_DIR)/%.o: $(S_DIR)/%.scm
	$(CC) -c $< -output-file "$@" $(CFLAGS)

# Main targets
$(TARGETS): $$(addprefix $(O_DIR)/, $$($$@_REQS))
	$(CC) $^ -output-file "$(B_DIR)/$(BIN_PREFIX)$@" -deploy $(CFLAGS)
	cp $(ROOT)/$(O_DIR)/deploy/* "$(B_DIR)/$(BIN_PREFIX)$@"/

.PHONY: clean
init:
	-mkdir -p $(B_DIR) $(I_DIR)
	-mkdir -p $(O_DIR)/targets
	-mkdir -p $(O_DIR)/units
	# re-creates the src/units directory tree.
	$(shell cd $(S_DIR)/units && find -type d -links 2 -exec mkdir -p "../../$(O_DIR)/units/{}" \;)

install:
	./scripts/development-eggs $(EGGS)

deploy:
	./scripts/deployment-eggs $(EGGS)
	
clean:
	-rm -rf ./$(O_DIR)/*
	-rm -rf ./$(B_DIR)/*
