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

{..\drivers\}.c{$(CFG)\$(PLAT)\mikmod\}.obj::
	$(CC) $(LIBMIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) /Fo$(CFG)\$(PLAT)\mikmod\ /c @<<
$<
<<

{..\loaders\}.c{$(CFG)\$(PLAT)\mikmod\}.obj::
	$(CC) $(LIBMIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) /Fo$(CFG)\$(PLAT)\mikmod\ /c @<<
$<
<<

{..\playercode\}.c{$(CFG)\$(PLAT)\mikmod\}.obj::
	$(CC) $(LIBMIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) /Fo$(CFG)\$(PLAT)\mikmod\ /c @<<
$<
<<

{..\mmio\}.c{$(CFG)\$(PLAT)\mikmod\}.obj::
	$(CC) $(LIBMIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) /Fo$(CFG)\$(PLAT)\mikmod\ /c @<<
$<
<<

{..\depackers\}.c{$(CFG)\$(PLAT)\mikmod\}.obj::
	$(CC) $(LIBMIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) /Fo$(CFG)\$(PLAT)\mikmod\ /c @<<
$<
<<

{..\playercode\}.c{$(CFG)\$(PLAT)\mikmod\}.obj::
	$(CC) $(LIBMIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) /Fo$(CFG)\$(PLAT)\mikmod\ /c @<<
$<
<<

{..\posix\}.c{$(CFG)\$(PLAT)\mikmod\}.obj::
	$(CC) $(LIBMIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) /Fo$(CFG)\$(PLAT)\mikmod\ /c @<<
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
$(MIKMOD_LIB): $(CFG)\$(PLAT)\mikmod.dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\mikmod.dll: $(CFG)\$(PLAT)\mikmod $(libmikmod_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(LIBMIKMOD_DEP_LIBS) $(libmikmod_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1
$(CFG)\$(PLAT)\mikmod-splay.exe: $(MIKMOD_LIB) $(CFG)\$(PLAT)\mikmod-ex ..\examples\simpleplay\splay.c
	$(CC) $(MIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) ..\examples\simpleplay\splay.c /Fo$(CFG)\$(PLAT)\mikmod-ex\$(@B).obj /c
	link $(LDFLAGS) $(CFG)\$(PLAT)\mikmod-ex\$(@B).obj $(MIKMOD_LIB) -out:$@
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\mikmod-splayFP.exe: $(MIKMOD_LIB) $(CFG)\$(PLAT)\mikmod-ex ..\examples\simpleplayFP\splayFP.c
	$(CC) $(MIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) ..\examples\simpleplayFP\splayFP.c /Fo$(CFG)\$(PLAT)\mikmod-ex\$(@B).obj /c
	link $(LDFLAGS) $(CFG)\$(PLAT)\mikmod-ex\$(@B).obj $(MIKMOD_LIB) -out:$@
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\mikmod-splayMEM.exe: $(MIKMOD_LIB) $(CFG)\$(PLAT)\mikmod-ex ..\examples\simpleplayMEM\splayMEM.c
	$(CC) $(MIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) ..\examples\simpleplayMEM\splayMEM.c /Fo$(CFG)\$(PLAT)\mikmod-ex\$(@B).obj /c
	$(CC) $(MIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) ..\examples\simpleplayMEM\myloader.c /Fo$(CFG)\$(PLAT)\mikmod-ex\myloader.obj /c
	link $(LDFLAGS) $(CFG)\$(PLAT)\mikmod-ex\$(@B).obj $(CFG)\$(PLAT)\mikmod-ex\myloader.obj $(MIKMOD_LIB) -out:$@
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\mikmod-splayMEM2.exe: $(MIKMOD_LIB) $(CFG)\$(PLAT)\mikmod-ex ..\examples\simpleplayMEM2\splayMEM2.c
	$(CC) $(MIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) ..\examples\simpleplayMEM2\splayMEM2.c /Fo$(CFG)\$(PLAT)\mikmod-ex\$(@B).obj /c
	link $(LDFLAGS) $(CFG)\$(PLAT)\mikmod-ex\$(@B).obj $(MIKMOD_LIB) -out:$@
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\mikmod-soundeffects.exe: $(MIKMOD_LIB) $(CFG)\$(PLAT)\mikmod-ex ..\examples\soundeffects\soundeffects.c
	$(CC) $(MIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) ..\examples\soundeffects\soundeffects.c /Fo$(CFG)\$(PLAT)\mikmod-ex\$(@B).obj /c
	link $(LDFLAGS) $(CFG)\$(PLAT)\mikmod-ex\$(@B).obj $(MIKMOD_LIB) -out:$@
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\mikmod-test.exe: $(MIKMOD_LIB) $(CFG)\$(PLAT)\mikmod-test ..\examples\test\test.c
	$(CC) $(MIKMOD_CFLAGS) $(LIBMIKMOD_INCLUDES) ..\examples\test\test.c /Fo$(CFG)\$(PLAT)\mikmod-test\$(@B).obj /c
	link $(LDFLAGS) $(CFG)\$(PLAT)\mikmod-test\$(@B).obj $(MIKMOD_LIB) -out:$@
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

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
	@-if exist $(CFG)\$(PLAT)\*.exe.manifest del /f /q $(CFG)\$(PLAT)\*.exe.manifest
	@-del /f /q $(CFG)\$(PLAT)\*.exe
	@-if exist $(CFG)\$(PLAT)\*.dll del /f /q $(CFG)\$(PLAT)\*.dll.manifest
	@-del /f /q $(CFG)\$(PLAT)\*.dll
	@-del /f /q $(CFG)\$(PLAT)\*.ilk
	@-del /f /q $(CFG)\$(PLAT)\mikmod\*.obj
	@-del /f /q $(CFG)\$(PLAT)\mikmod-ex\*.obj
	@-del /f /q $(CFG)\$(PLAT)\mikmod-test\*.obj
	@-del /f /q vc$(VSVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
