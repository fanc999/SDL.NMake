# NMake Makefile portion for compilation rules
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.  The format
# of NMake Makefiles here are different from the GNU
# Makefiles.  Please see the comments about these formats.

# Inference rules for compiling the .obj files.
# Used for libs and programs with more than a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.obj::
# 	$(CC)|$(CXX) $(cflags) /Fo$(destdir) /c @<<
# $<
# <<

.SUFFIXES: .c .S .obj .asm

{..\src\libmpg123\}.c{$(CFG)\$(PLAT)\libmpg123\}.obj::
	$(CC) $(LIBMPG123_INCLUDES) $(LIBMPG123_CFLAGS) /Fo$(CFG)\$(PLAT)\libmpg123\ /c @<<
$<
<<

{..\src\libmpg123\}.S{$(CFG)\$(PLAT)\libmpg123\}.obj:
	$(CPP) $(LIBMPG123_INCLUDES) $(LIBMPG123_CFLAGS) /FI..\nmake\mangle.h /EP /TC $< /nologo > $(CFG)\$(PLAT)\libmpg123\$(@B).asm
	$(YASM) $(YASM_BASE_FLAGS) $(YASM_ARCH_FLAGS) -o $@ $(CFG)\$(PLAT)\libmpg123\$(@B).asm

{..\src\libout123\}.c{$(CFG)\$(PLAT)\libout123\}.obj::
	$(CC) $(LIBOUT123_INCLUDES) $(LIBOUT123_CFLAGS) /Fo$(CFG)\$(PLAT)\libout123\ /c @<<
$<
<<

{..\src\libout123\modules\}.c{$(CFG)\$(PLAT)\libout123\}.obj::
	$(CC) $(LIBOUT123_INCLUDES) $(LIBOUT123_CFLAGS) /Fo$(CFG)\$(PLAT)\libout123\ /c @<<
$<
<<

{..\src\compat\}.c{$(CFG)\$(PLAT)\mpg123-compat\}.obj::
	$(CC) $(LIBMPG123_INCLUDES) $(LIBMPG123_CFLAGS) /Fo$(CFG)\$(PLAT)\mpg123-compat\ /c @<<
$<
<<

{..\ports\MSVC++\}.c{$(CFG)\$(PLAT)\mpg123-compat\}.obj::
	$(CC) $(LIBMPG123_INCLUDES) $(LIBMPG123_CFLAGS) /Fo$(CFG)\$(PLAT)\mpg123-compat\ /c @<<
$<
<<

# Rules for building .rc files

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]

# Rules for building .lib files
$(LIBMPG123_LIB): $(CFG)\$(PLAT)\libmpg123.dll
$(LIBOUT123_LIB): $(CFG)\$(PLAT)\libout123.dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\libmpg123.dll: $(CFG)\$(PLAT)\libmpg123 $(CFG)\$(PLAT)\mpg123-compat $(libmpg123_OBJS) $(mpg123_compat_OBJS)
	link /DLL $(LIBMPG123_LDFLAGS) -out:$@ $(LIBMPG123_DEP_LIBS) $(libmpg123_OBJS) $(mpg123_compat_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

$(CFG)\$(PLAT)\libout123.dll: $(LIBMPG123_LIB) $(CFG)\$(PLAT)\libout123\out123.h $(libout123_OBJS) $(mpg123_compat_OBJS)
	link /DLL $(LIBMPG123_LDFLAGS) -out:$@ $(LIBMPG123_LIB) $(LIBOUT123_DEP_LIBS) $(libout123_OBJS) $(mpg123_compat_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Other .obj files requiring individual attention, that could not be covered by the inference rules.
# Format is as follows (all dirs must have a trailing '\'):
#
# $(obj_file):
# 	$(CC)|$(CXX) $(cflags) /Fo$(obj_destdir) /c @<<
# $(srcfile)
# <<

clean:
	@-del /f /q $(CFG)\$(PLAT)\*.lib
	@-del /f /q $(CFG)\$(PLAT)\*.pdb
	@-if exist $(CFG)\$(PLAT)\*.dll del /f /q $(CFG)\$(PLAT)\*.dll.manifest
	@-del /f /q $(CFG)\$(PLAT)\*.dll
	@-del /f /q $(CFG)\$(PLAT)\*.ilk
	@-del /f /q $(CFG)\$(PLAT)\libout123\*.obj
	@-del /f /q $(CFG)\$(PLAT)\libout123\out123.h
	@-del /f /q $(CFG)\$(PLAT)\libmpg123\*.obj
	@-del /f /q $(CFG)\$(PLAT)\libmpg123\*.asm
	@-del /f /q $(CFG)\$(PLAT)\mpg123-compat\*.obj
	@-del /f /q vc$(VSVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
