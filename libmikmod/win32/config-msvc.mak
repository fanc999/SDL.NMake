# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into libmikmod on Windows
MIKMOD_CFLAGS =	\
	$(CFLAGS)	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/DHAVE_LIMITS_H	\
	/DHAVE_FCNTL_H
	
LIBMIKMOD_CFLAGS =	\
	$(MIKMOD_CFLAGS)	\
	/DMIKMOD_BUILD	\
	/DDLL_EXPORT	\
	/DDRV_DS	\
	/DDRV_WIN	\
	/DDRV_AIFF	\
	/DDRV_WAV	\
	/DDRV_RAW

LIBMIKMOD_INCLUDES = /I..\win32 /I..\include

LIBMIKMOD_ADDITIONAL_LIBS =

!if "$(SIMD)" == "1"
# Experimental!  SIMD2 optimizations are not stable at this point
LIBMIKMOD_CFLAGS = $(LIBMIKMOD_CFLAGS) /DMIKMOD_SIMD
!endif

!if "$(OPENAL)" == "1"
LIBMIKMOD_CFLAGS = $(LIBMIKMOD_CFLAGS) /DDRV_OPENAL
LIBMIKMOD_ADDITIONAL_LIBS = $(LIBMIKMOD_ADDITIONAL_LIBS) openal32.lib
!endif

!if "$(SDL)" == "1" || "$(SDL2)" == "1"
LIBMIKMOD_CFLAGS = $(LIBMIKMOD_CFLAGS) /DDRV_SDL
!if "$(SDL2)" == "1"
LIBMIKMOD_ADDITIONAL_LIBS = $(LIBMIKMOD_ADDITIONAL_LIBS) SDL2.lib
!else
LIBMIKMOD_ADDITIONAL_LIBS = $(LIBMIKMOD_ADDITIONAL_LIBS) SDL.lib
!endif
!endif

!if "$(XAUDIO2)" == "1"
# Note: You need the June 2010 DirectX SDK, and ensure that $(DXSDK_DIR)\include
#       and $(DXSDK_DIR)\lib\[x86|x64] are in your INCLUDE and LIB paths respectively,
#       to enable XAudio2 support.  Alternatively, use DXSDK_DIR=<root_path_of_your_dx201006_sdk>,
#       if targeting against Windows 7.
LIBMIKMOD_CFLAGS = $(LIBMIKMOD_CFLAGS) /DDRV_XAUDIO2
LIBMIKMOD_ADDITIONAL_LIBS = $(LIBMIKMOD_ADDITIONAL_LIBS) ole32.lib
!if "$(WIN8)" == "1"
LIBMIKMOD_CFLAGS = $(LIBMIKMOD_CFLAGS) /DDRV_XAUDIO28
LIBMIKMOD_ADDITIONAL_LIBS = $(LIBMIKMOD_ADDITIONAL_LIBS) xaudio2_8.lib
!else

!if "$(DXSDK_DIR)" != ""
LIBMIKMOD_CFLAGS = /I"$(DXSDK_DIR)\include" $(LIBMIKMOD_CFLAGS)
!endif

!endif
!endif

# We build the SDL2/SDL2main DLL/LIB at least
MIKMOD_LIB = $(CFG)\$(PLAT)\mikmod.lib

LIBMIKMOD_DEP_LIBS =	\
	winmm.lib	\
	dsound.lib	\
	user32.lib	\
	$(LIBMIKMOD_ADDITIONAL_LIBS)

MIKMOD_EX_PROGRAMS =	\
	$(CFG)\$(PLAT)\mikmod-splay.exe	\
	$(CFG)\$(PLAT)\mikmod-splayFP.exe	\
	$(CFG)\$(PLAT)\mikmod-splayMEM.exe	\
	$(CFG)\$(PLAT)\mikmod-splayMEM2.exe	\
	$(CFG)\$(PLAT)\mikmod-soundeffects.exe

MIKMOD_TEST_PROGRAMS = $(CFG)\$(PLAT)\mikmod-test.exe
