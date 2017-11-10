# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into libmikmod on Windows

MPG123_BASE_OPT_FLAGS = /DOPT_GENERIC

MPG123_BASE_OPT_ASM_FLAGS = /DOPT_MULTI $(MPG123_BASE_OPT_FLAGS)

!if "$(USE_ASM_OPT)" == "1"
MPG123_OPT_FLAGS = $(MPG123_OPT_ASM_FLAGS)
YASM_BASE_FLAGS = -a x86 -p gas -r raw -g null 

!if "$(YASM)" == ""
YASM = yasm
!endif

!if "$(PLAT)" == "x64"
MPG123_OPT_ASM_FLAGS = $(MPG123_BASE_OPT_ASM_FLAGS) /DOPT_X86_64
YASM_ARCH_FLAGS = -m amd64 -f win64
!else
MPG123_OPT_ASM_FLAGS =	\
	$(MPG123_BASE_OPT_ASM_FLAGS)	\
	/DOPT_I386	\
	/DOPT_I586	\
	/DOPT_MMX	\
	/DOPT_3DNOW	\
	/DOPT_3DNOWEXT	\
	/DOPT_SSE

YASM_ARCH_FLAGS = -m x86 -f win32
!endif

!else
MPG123_OPT_FLAGS = $(MPG123_BASE_OPT_FLAGS)
MPG123_OPT_ASM_FLAGS =
YASM_ARCH_FLAGS =
!endif

!if "$(SDL)" == "1"
LIBOUT123_DEFAULT_OUTPUT_MODULE=sdl
LIBOUT123_MOD_DEP_LIBS = SDL2.lib
!elseif "$(OPENAL)" == "1"
LIBOUT123_DEFAULT_OUTPUT_MODULE=openal
LIBOUT123_MOD_DEP_LIBS = openal32.lib
!elseif "$(LEGACY_WINDOWS)" == "1"
LIBOUT123_DEFAULT_OUTPUT_MODULE=win32
LIBOUT123_MOD_DEP_LIBS = winmm.lib
!else
LIBOUT123_DEFAULT_OUTPUT_MODULE=win32_wasapi
LIBOUT123_MOD_DEP_LIBS = avrt.lib ole32.lib
!endif

MPG123_CFLAGS =	\
	$(CFLAGS)	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	/DWIN32

LIBMPG123_CFLAGS =	\
	$(MPG123_CFLAGS)	\
	/DBUILD_MPG123_DLL	\
	$(MPG123_OPT_FLAGS)	\

LIBMPG123_INCLUDES = /I. /I..\ports\MSVC++ /I..\src /I..\src\libmpg123 /I..\src\compat
LIBMPG123_LDFLAGS = $(LDFLAGS) /BASE:0x63000000

LIBOUT123_CFLAGS =	\
	$(LIBMPG123_CFLAGS)	\
	/DNOXFERMEM	\
	/DSTDOUT_FILENO=1	\
	/DDEFAULT_OUTPUT_MODULE=\"$(LIBOUT123_DEFAULT_OUTPUT_MODULE)\"
LIBOUT123_INCLUDES = /I$(CFG)\$(PLAT)\libout123 /I..\src\libout123 $(LIBMPG123_INCLUDES)

# We build the libmpg123/libout123 DLL/LIB at least
LIBMPG123_LIB = $(CFG)\$(PLAT)\libmpg123.lib
LIBOUT123_LIB = $(CFG)\$(PLAT)\libout123.lib

LIBMPG123_LIBS = $(LIBMPG123_LIB) $(LIBOUT123_LIB)

LIBMPG123_DEP_LIBS = shlwapi.lib user32.lib
LIBOUT123_DEP_LIBS = $(LIBOUT123_MOD_DEP_LIBS) $(LIBMPG123_DEP_LIBS)
