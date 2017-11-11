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

{..\timidity\}.c{$(CFG)\$(PLAT)\SDL2_mixer\}.obj::
	$(CC) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\SDL2_mixer\ /c @<<
$<
<<

{..\native_midi\}.c{$(CFG)\$(PLAT)\SDL2_mixer\}.obj::
	$(CC) $(BASE_CFLAGS) /Fo$(CFG)\$(PLAT)\SDL2_mixer\ /c @<<
$<
<<

{..\}.c{$(CFG)\$(PLAT)\SDL2_mixer\}.obj::
	$(CC) $(SDL_MIXER_CFLAGS) /Fo$(CFG)\$(PLAT)\SDL2_mixer\ /c @<<
$<
<<

# Rules for building .rc files
$(CFG)\$(PLAT)\SDL2_mixer\version.res: ..\VisualC\version.rc
	$(RC) /fo$@ ..\VisualC\version.rc

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]

# Rules for building .lib files
$(SDL_MIXER_LIB): $(CFG)\$(PLAT)\SDL2_mixer.dll

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\SDL2_mixer.dll: $(CFG)\$(PLAT)\SDL2_mixer $(sdl2_mixer_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(SDL_MIXER_ADDITIONAL_LIBS) $(sdl2_mixer_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\playwave.exe: $(SDL_MIXER_LIB) $(CFG)\$(PLAT)\SDL2_mixer\playwave.obj
	link $(SDL_SAMPLE_LDFLAGS) -out:$@ $(SDL_MIXER_LIB) $(SDL_SAMPLE_BASE_LIBS) $(CFG)\$(PLAT)\SDL2_mixer\$(@B).obj
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\playmus.exe: $(SDL_MIXER_LIB) $(CFG)\$(PLAT)\SDL2_mixer\playmus.obj
	link $(SDL_SAMPLE_LDFLAGS) -out:$@ $(SDL_MIXER_LIB) $(SDL_SAMPLE_BASE_LIBS) $(CFG)\$(PLAT)\SDL2_mixer\$(@B).obj
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
	@-del /f /q $(CFG)\$(PLAT)\SDL2_mixer\*.obj
	@-del /f /q vc$(VSVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
