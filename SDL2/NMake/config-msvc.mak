# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into FLAC on Windows
SDL_CFLAGS =	\
	$(CFLAGS)	\
	/DWIN32		\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	/DHAVE_MATH_H	\
	/D_USE_MATH_DEFINES	\
	/DHAVE_M_PI			\
	/wd4244

# WinRT/UWP builds are not supported yet
SDL_WINRT_CXXFLAGS =	\
	$(SDL_CFLAGS) /ZW	\
	/DUNICODE /EHsc		\
	/DSDL_BUILDING_WINRT=1

SDL_INCLUDES = /I..\include

# We build the SDL2/SDL2main DLL/LIB at least
SDL_LIB = $(CFG)\$(PLAT)\SDL2.lib
SDLMAIN_LIB = $(CFG)\$(PLAT)\SDL2main.lib
SDLTEST_LIB = $(CFG)\$(PLAT)\SDL2test.lib

SDL_LIBS = $(SDL_LIB) $(SDLMAIN_LIB)

SDL_DEP_LIBS =	\
	advapi32.lib	\
	gdi32.lib	\
	imm32.lib	\
	kernel32.lib	\
	ole32.lib	\
	oleaut32.lib	\
	shell32.lib	\
	user32.lib	\
	version.lib	\
	winmm.lib

SDL_TEST_LDFLAG = $(LDFLAGS) /subsystem:console

# Determine what sources will be used for our build
sdl2_OBJS = $(sdl2_all_OBJS)

!if $(VSVER) < 11
!if "$(WINRT)" == "1"
!message WINRT configuration not supported for MSVC 2012 or earlier, disabling
WINRT=
!endif
!endif

!if "$(WINRT)" == "1"
sdl2_OBJS = $(sdl2_OBJS) $(sdl2_winrt_OBJS)
!else
sdl2_OBJS = $(sdl2_OBJS) $(sdl2_math_OBJS) $(sdl2_win32_OBJS)
!endif

SDL_TEST_PROGRAMS =	\
	$(CFG)\$(PLAT)\checkkeys.exe	\
	$(CFG)\$(PLAT)\loopwave.exe	\
	$(CFG)\$(PLAT)\loopwavequeue.exe	\
	$(CFG)\$(PLAT)\testatomic.exe	\
	$(CFG)\$(PLAT)\testaudioinfo.exe	\
	$(CFG)\$(PLAT)\testaudiocapture.exe	\
	$(CFG)\$(PLAT)\testautomation.exe	\
	$(CFG)\$(PLAT)\testbounds.exe	\
	$(CFG)\$(PLAT)\testcustomcursor.exe	\
	$(CFG)\$(PLAT)\testdraw2.exe	\
	$(CFG)\$(PLAT)\testdrawchessboard.exe	\
	$(CFG)\$(PLAT)\testdropfile.exe	\
	$(CFG)\$(PLAT)\testerror.exe	\
	$(CFG)\$(PLAT)\testfile.exe	\
	$(CFG)\$(PLAT)\testgamecontroller.exe	\
	$(CFG)\$(PLAT)\testgesture.exe	\
	$(CFG)\$(PLAT)\testgl2.exe	\
	$(CFG)\$(PLAT)\testgles.exe	\
	$(CFG)\$(PLAT)\testgles2.exe	\
	$(CFG)\$(PLAT)\testhaptic.exe	\
	$(CFG)\$(PLAT)\testhittesting.exe	\
	$(CFG)\$(PLAT)\testrumble.exe	\
	$(CFG)\$(PLAT)\testhotplug.exe	\
	$(CFG)\$(PLAT)\testthread.exe	\
	$(CFG)\$(PLAT)\testiconv.exe	\
	$(CFG)\$(PLAT)\testime.exe	\
	$(CFG)\$(PLAT)\testintersections.exe	\
	$(CFG)\$(PLAT)\testrelative.exe	\
	$(CFG)\$(PLAT)\testjoystick.exe	\
	$(CFG)\$(PLAT)\testkeys.exe	\
	$(CFG)\$(PLAT)\testloadso.exe	\
	$(CFG)\$(PLAT)\testlock.exe	\
	$(CFG)\$(PLAT)\testmultiaudio.exe	\
	$(CFG)\$(PLAT)\testaudiohotplug.exe	\
	$(CFG)\$(PLAT)\testnative.exe	\
	$(CFG)\$(PLAT)\testoverlay2.exe	\
	$(CFG)\$(PLAT)\testplatform.exe	\
	$(CFG)\$(PLAT)\testpower.exe	\
	$(CFG)\$(PLAT)\testfilesystem.exe	\
	$(CFG)\$(PLAT)\testrendertarget.exe	\
	$(CFG)\$(PLAT)\testresample.exe	\
	$(CFG)\$(PLAT)\testscale.exe	\
	$(CFG)\$(PLAT)\testsem.exe	\
	$(CFG)\$(PLAT)\testshader.exe	\
	$(CFG)\$(PLAT)\testshape.exe	\
	$(CFG)\$(PLAT)\testsprite2.exe	\
	$(CFG)\$(PLAT)\testspriteminimal.exe	\
	$(CFG)\$(PLAT)\teststreaming.exe	\
	$(CFG)\$(PLAT)\testtimer.exe	\
	$(CFG)\$(PLAT)\testver.exe	\
	$(CFG)\$(PLAT)\testviewport.exe	\
	$(CFG)\$(PLAT)\testwm2.exe	\
	$(CFG)\$(PLAT)\torturethread.exe	\
	$(CFG)\$(PLAT)\testrendercopyex.exe	\
	$(CFG)\$(PLAT)\testmessage.exe	\
	$(CFG)\$(PLAT)\testdisplayinfo.exe	\
	$(CFG)\$(PLAT)\testqsort.exe	\
	$(CFG)\$(PLAT)\controllermap.exe	\
	$(CFG)\$(PLAT)\testvulkan.exe

