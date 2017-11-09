# Convert the source listing to object (.obj) listing in
# another NMake Makefile module, include it, and clean it up.
# This is a "fact-of-life" regarding NMake Makefiles...
# This file does not need to be changed unless one is maintaining the NMake Makefiles

# For those wanting to add things here:
# To add a list, do the following:
# # $(description_of_list)
# if [call create-lists.bat header $(makefile_snippet_file) $(variable_name)]
# endif
#
# if [call create-lists.bat file $(makefile_snippet_file) $(file_name)]
# endif
#
# if [call create-lists.bat footer $(makefile_snippet_file)]
# endif
# ... (repeat the if [call ...] lines in the above order if needed)
# !include $(makefile_snippet_file)
#
# (add the following after checking the entries in $(makefile_snippet_file) is correct)
# (the batch script appends to $(makefile_snippet_file), you will need to clear the file unless the following line is added)
#!if [del /f /q $(makefile_snippet_file)]
#!endif

# In order to obtain the .obj filename that is needed for NMake Makefiles to build DLLs/static LIBs or EXEs, do the following
# instead when doing 'if [call create-lists.bat file $(makefile_snippet_file) $(file_name)]'
# (repeat if there are multiple $(srcext)'s in $(source_list), ignore any headers):
# !if [for %c in ($(source_list)) do @if "%~xc" == ".$(srcext)" @call create-lists.bat file $(makefile_snippet_file) $(intdir)\%~nc.obj]
#
# $(intdir)\%~nc.obj needs to correspond to the rules added in build-rules-msvc.mak
# %~xc gives the file extension of a given file, %c in this case, so if %c is a.cc, %~xc means .cc
# %~nc gives the file name of a given file without extension, %c in this case, so if %c is a.cc, %~nc means a

MPG123_COMPAT_SRCS =	\
	..\src\compat\compat_str.c	\
	..\src\compat\compat.c

!if "$(USE_ASM_OPT)" == "1"
MPG123_ASM_OPT_SRCS = ..\src\libmpg123\dct64_i386.c
!if "$(PLAT)" == "x64"
MPG123_ASM_SRCS =	\
	..\src\libmpg123\getcpuflags_x86_64.S	\
	..\src\libmpg123\dct36_x86_64.S	\
	..\src\libmpg123\synth_x86_64_float.S	\
	..\src\libmpg123\synth_x86_64_s32.S	\
	..\src\libmpg123\synth_stereo_x86_64_float.S	\
	..\src\libmpg123\synth_stereo_x86_64_s32.S	\
	..\src\libmpg123\synth_x86_64.S	\
	..\src\libmpg123\dct64_x86_64.S	\
	..\src\libmpg123\dct64_x86_64_float.S	\
	..\src\libmpg123\synth_stereo_x86_64.S	\
	..\src\libmpg123\synth_x86_64_accurate.S	\
	..\src\libmpg123\synth_stereo_x86_64_accurate.S

!else
MPG123_ASM_SRCS =	\
	..\src\libmpg123\dct36_3dnow.S	\
	..\src\libmpg123\dct36_3dnowext.S	\
	..\src\libmpg123\dct36_sse.S	\
	..\src\libmpg123\dct64_3dnow.S	\
	..\src\libmpg123\dct64_3dnowext.S	\
	..\src\libmpg123\dct64_mmx.S	\
	..\src\libmpg123\dct64_sse.S	\
	..\src\libmpg123\dct64_sse_float.S	\
	..\src\libmpg123\equalizer_3dnow.S	\
	..\src\libmpg123\getcpuflags.S	\
	..\src\libmpg123\synth_3dnow.S	\
	..\src\libmpg123\synth_3dnowext.S	\
	..\src\libmpg123\synth_i586.S	\
	..\src\libmpg123\synth_mmx.S	\
	..\src\libmpg123\synth_sse.S	\
	..\src\libmpg123\synth_sse_float.S	\
	..\src\libmpg123\synth_stereo_sse_float.S	\
	..\src\libmpg123\tabinit_mmx.S	\
	..\src\libmpg123\synth_sse_accurate.S	\
	..\src\libmpg123\synth_sse_s32.S	\
	..\src\libmpg123\synth_stereo_sse_accurate.S	\
	..\src\libmpg123\synth_stereo_sse_s32.S

!endif
!else
MPG123_ASM_OPT_SRCS =
MPG123_ASM_SRCS =
!endif

MPG123_MSVC_COMPAT_SRCS = ..\ports\MSVC++\msvc.c

LIBMPG123_BASE_SRCS =	\
	..\src\libmpg123\dct64.c	\
	..\src\libmpg123\equalizer.c	\
	..\src\libmpg123\feature.c	\
	..\src\libmpg123\format.c	\
	..\src\libmpg123\frame.c	\
	..\src\libmpg123\icy.c	\
	..\src\libmpg123\icy2utf8.c	\
	..\src\libmpg123\id3.c	\
	..\src\libmpg123\index.c	\
	..\src\libmpg123\layer1.c	\
	..\src\libmpg123\layer2.c	\
	..\src\libmpg123\layer3.c	\
	..\src\libmpg123\libmpg123.c	\
	..\src\libmpg123\ntom.c	\
	..\src\libmpg123\optimize.c	\
	..\src\libmpg123\parse.c	\
	..\src\libmpg123\readers.c	\
	..\src\libmpg123\stringbuf.c	\
	..\src\libmpg123\synth.c	\
	..\src\libmpg123\synth_8bit.c	\
	..\src\libmpg123\synth_real.c	\
	..\src\libmpg123\synth_s32.c	\
	..\src\libmpg123\tabinit.c

NULL=

# Create the list of .obj files
!if [call create-lists.bat header mpg123_objs.mak libmpg123_OBJS]
!endif

!if [for %c in ($(LIBMPG123_BASE_SRCS) $(MPG123_ASM_OPT_SRCS)) do @if "%~xc" == ".c" @call create-lists.bat file mpg123_objs.mak ^$(CFG)\^$(PLAT)\libmpg123\%~nc.obj]
!endif

!if [for %c in ($(MPG123_ASM_SRCS)) do @if "%~xc" == ".S" @call create-lists.bat file mpg123_objs.mak ^$(CFG)\^$(PLAT)\libmpg123\%~nc.obj]
!endif

!if [call create-lists.bat footer mpg123_objs.mak]
!endif

!if [call create-lists.bat header mpg123_objs.mak mpg123_compat_OBJS]
!endif

!if [for %c in ($(MPG123_COMPAT_SRCS) $(MPG123_MSVC_COMPAT_SRCS)) do @if "%~xc" == ".c" @call create-lists.bat file mpg123_objs.mak ^$(CFG)\^$(PLAT)\mpg123-compat\%~nc.obj]
!endif

!if [call create-lists.bat footer mpg123_objs.mak]
!endif

!include mpg123_objs.mak

!if [del /f /q mpg123_objs.mak]
!endif
