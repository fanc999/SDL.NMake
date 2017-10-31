# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Create the build directories
$(CFG)\$(PLAT)\SDL2	\
$(CFG)\$(PLAT)\SDL2main	\
$(CFG)\$(PLAT)\SDL2test:
	@-md $@
