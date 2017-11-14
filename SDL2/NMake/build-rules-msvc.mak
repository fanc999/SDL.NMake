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

{..\src\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\atomic\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\audio\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\audio\disk\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\audio\dummy\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\audio\directsound\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\audio\wasapi\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\audio\winmm\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\audio\xaudio2\}.cpp{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CXX) $(SDL_WINRT_CXXFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\core\windows\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\core\winrt\}.cpp{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CXX) $(SDL_WINRT_CXXFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\cpuinfo\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\dynapi\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\events\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\file\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\filesystem\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\filesystem\windows\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\filesystem\winrt\}.cpp{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CXX) $(SDL_WINRT_CXXFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\haptic\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\haptic\dummy\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\haptic\windows\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\joystick\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\joystick\dummy\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\joystick\windows\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\libm\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\loadso\windows\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\main\windows\}.c{$(CFG)\$(PLAT)\SDL2main\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2main\ /c /Fd$(CFG)\$(PLAT)\SDL2main.pdb @<<
$<
<<

{..\src\power\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\power\windows\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\power\winrt\}.cpp{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_WINRT_CXXFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\render\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\render\direct3d\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\render\direct3d11\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\render\direct3d11\}.cpp{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_WINRT_CXXFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\render\opengl\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\render\opengles2\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\render\software\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\stdlib\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\thread\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\thread\generic\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\thread\stdcpp\}.cpp{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_WINRT_CXXFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\thread\windows\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\timer\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\timer\windows\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\video\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\video\dummy\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\video\windows\}.c{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\video\winrt\}.cpp{$(CFG)\$(PLAT)\SDL2\}.obj::
	$(CXX) $(SDL_WINRT_CXXFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2\ /c @<<
$<
<<

{..\src\test\}.c{$(CFG)\$(PLAT)\SDL2test\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2test\ /c @<<
$<
<<

{..\test\}.c{$(CFG)\$(PLAT)\SDL2test\}.obj::
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) /Fo$(CFG)\$(PLAT)\SDL2test\ /c @<<
$<
<<

# Rules for building .rc files
$(CFG)\$(PLAT)\SDL2\version.res: ..\src\main\windows\version.rc
	$(RC) /fo$@ ..\src\main\windows\version.rc

# Inference rules for building the test programs
# Used for programs with a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.exe::
# 	$(CC)|$(CXX) $(cflags) $< /Fo$*.obj  /Fe$@ [/link $(linker_flags) $(dep_libs)]

{..\test\}.c{$(CFG)\$(PLAT)\}.exe:
	$(CC) $(SDL_CFLAGS) $(SDL_INCLUDES) $< /Fo$(CFG)\$(PLAT)\SDL2test\$(@B).obj /Fe$@ /link $(SDL_TEST_LDFLAG) $(SDL_LIBS) $(SDLTEST_LIB)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Rules for building .lib files
$(SDL_LIB): $(CFG)\$(PLAT)\SDL2.dll

$(SDLMAIN_LIB): $(CFG)\$(PLAT)\SDL2main $(sdl2main_OBJS)
	lib $(LDFLAGS_ARCH) $(ARFLAGS) /out:$@ @<<
$(sdl2main_OBJS)
<<

$(SDLTEST_LIB): $(CFG)\$(PLAT)\SDL2test $(sdl2test_OBJS)
	lib $(LDFLAGS_ARCH) $(ARFLAGS) /out:$@ @<<
$(sdl2test_OBJS)
<<

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2
$(CFG)\$(PLAT)\SDL2.dll: $(CFG)\$(PLAT)\SDL2 $(sdl2_OBJS)
	link /DLL $(LDFLAGS) -out:$@ $(SDL_DEP_LIBS) $(sdl2_OBJS)
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1
$(CFG)\$(PLAT)\testnative.exe: $(SDL_LIBS) $(SDLTEST_LIB) $(sdl2_native_test_OBJS)
	link $(LDFLAGS) $(sdl2_native_test_OBJS) $(SDL_LIBS) $(SDLTEST_LIB) user32.lib -out:$@ /subsystem:windows
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

$(CFG)\$(PLAT)\testautomation.exe: $(SDL_LIBS) $(SDLTEST_LIB) $(sdl2_automation_test_OBJS)
	link $(LDFLAGS) $(sdl2_automation_test_OBJS) $(SDL_LIBS) $(SDLTEST_LIB) $(SDL_TEST_LDFLAG) /out:$@
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

# Other .obj files requiring individual attention, that could not be covered by the inference rules.
# Format is as follows (all dirs must have a trailing '\'):
#
# $(obj_file):
# 	$(CC)|$(CXX) $(cflags) /Fo$(obj_destdir) /c @<<
# $(srcfile)
# <<
$(CFG)\$(PLAT)\SDL2\SDL_xaudio2.obj: $(CFG)\$(PLAT)\SDL2 ..\src\audio\xaudio2\SDL_xaudio2.c
	$(CC) $(SDL_XAUDIO2_CFLAGS) $(SDL_INCLUDES) ..\src\audio\xaudio2\SDL_xaudio2.c /Fo$@ /c

$(CFG)\$(PLAT)\SDL2\SDL_audio.obj: $(CFG)\$(PLAT)\SDL2 ..\src\audio\SDL_audio.c
	$(CC) $(SDL_XAUDIO2_CFLAGS) $(SDL_INCLUDES) ..\src\audio\SDL_audio.c /Fo$@ /c

clean:
	@-del /f /q $(CFG)\$(PLAT)\*.lib
	@-del /f /q $(CFG)\$(PLAT)\*.pdb
	@-if exist $(CFG)\$(PLAT)\*.exe.manifest del /f /q $(CFG)\$(PLAT)\*.exe.manifest
	@-del /f /q $(CFG)\$(PLAT)\*.exe
	@-if exist $(CFG)\$(PLAT)\*.dll del /f /q $(CFG)\$(PLAT)\*.dll.manifest
	@-del /f /q $(CFG)\$(PLAT)\*.dll
	@-del /f /q $(CFG)\$(PLAT)\*.ilk
	@-del /f /q $(CFG)\$(PLAT)\SDL2\*.obj
	@-del /f /q $(CFG)\$(PLAT)\SDL2main\*.obj
	@-del /f /q $(CFG)\$(PLAT)\SDL2test\*.obj
	@-del /f /q vc$(VSVER)0.pdb
	@-rmdir /s /q $(CFG)\$(PLAT)
