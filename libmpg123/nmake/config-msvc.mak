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

YASM_ARCH_FLAGS = -m x86 -f win32 -P ..\src\libmpg123\mangle.h
!endif

!else
MPG123_OPT_FLAGS = $(MPG123_BASE_OPT_FLAGS)
MPG123_OPT_ASM_FLAGS =
YASM_ARCH_FLAGS =
!endif

LIBMPG123_CFLAGS =	\
	$(CFLAGS)	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	/DBUILD_MPG123_DLL	\
	$(MPG123_OPT_FLAGS)	\
	/DWIN32

LIBMPG123_INCLUDES = /I. /I..\ports\MSVC++ /I..\src /I..\src\libmpg123 /I..\src\compat
LIBMPG123_LDFLAGS = $(LDFLAGS) /BASE:0x63000000

# We build the libmpg123 DLL/LIB at least
LIBMPG123_LIB = $(CFG)\$(PLAT)\libmpg123.lib

LIBMPG123_DEP_LIBS = shlwapi.lib user32.lib
