# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into libmikmod on Windows
MODPLUG_CFLAGS =	\
	$(CFLAGS)	\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	/DHAVE_CONFIG_H	\
	/EHsc
	
LIBMODPLUG_CFLAGS =	\
	$(MODPLUG_CFLAGS)	\
	/DMODPLUG_BUILD	\
	/DDLL_EXPORT

LIBMODPLUG_INCLUDES = /I..\win32 /I..\src\libmodplug

# We build the libmodplug DLL/LIB at least
MODPLUG_LIB = $(CFG)\$(PLAT)\modplug.lib

LIBMODPLUG_DEP_LIBS = user32.lib
