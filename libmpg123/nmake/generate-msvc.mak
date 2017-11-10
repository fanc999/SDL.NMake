# NMake Makefile portion for code generation and
# intermediate build directory creation
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.

# Create the build directories
$(CFG)\$(PLAT)\libmpg123	\
$(CFG)\$(PLAT)\mpg123-compat	\
$(CFG)\$(PLAT)\libout123	\
$(CFG)\$(PLAT)\mpg123:
	@-md $@

# Copy out123.h from out123.h.in
$(CFG)\$(PLAT)\libout123\out123.h: ..\src\libout123\out123.h.in $(CFG)\$(PLAT)\libout123
	@if not exist $@ copy ..\src\libout123\$(@F).in $@
