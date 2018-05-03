outDir := /tmp/gmp
sutSrc := $(outDir)/_.c
sutBin := $(outDir)/_.o

define setUp
rm -rf $(outDir)
mkdir $(outDir)
endef

# command lines prefixed with an @ character are not echoed by make
define buildSUT
@echo "int main(void) { return 0; }" > $(sutSrc)
endef

__:
	@$(setUp)
	$(buildSUT)
	$(CC) -o $(sutBin) $(sutSrc)
	$(sutBin)

