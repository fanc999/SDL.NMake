# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into FLAC on Windows
BASE_CFLAGS =	\
	$(CFLAGS)	\
	/DWIN32		\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS

SDL_IMAGE_CFLAGS =	\
	$(BASE_CFLAGS)	\
	/DLOAD_BMP	\
	/DLOAD_GIF	\
	/DLOAD_LBM	\
	/DLOAD_PCX	\
	/DLOAD_PNM	\
	/DLOAD_SVG	\
	/DLOAD_TGA	\
	/DLOAD_XPM	\
	/DLOAD_XV

SDL_LIB = SDL2.lib
SDL_MAIN_LIB = SDL2main.lib

SDL_IMAGE_ADDITIONAL_LIBS = $(SDL_LIB)

!if "$(PNG)" == "1"
SDL_IMAGE_CFLAGS = $(SDL_IMAGE_CFLAGS) /DLOAD_PNG /DPNG_USE_DLL /DZLIB_DLL
SDL_IMAGE_ADDITIONAL_LIBS = $(SDL_IMAGE_ADDITIONAL_LIBS) libpng16.lib zlib1.lib
!endif

!if "$(JPEG)" == "1"
SDL_IMAGE_CFLAGS = $(SDL_IMAGE_CFLAGS) /DLOAD_JPG
SDL_IMAGE_ADDITIONAL_LIBS = $(SDL_IMAGE_ADDITIONAL_LIBS) jpeg.lib
!endif

!if "$(TIFF)" == "1"
SDL_IMAGE_CFLAGS = $(SDL_IMAGE_CFLAGS) /DLOAD_TIF
SDL_IMAGE_ADDITIONAL_LIBS = $(SDL_IMAGE_ADDITIONAL_LIBS) libtiff_i.lib
!endif

!if "$(WEBP)" == "1"
SDL_IMAGE_CFLAGS = $(SDL_IMAGE_CFLAGS) /DLOAD_WEBP
SDL_IMAGE_ADDITIONAL_LIBS = $(SDL_IMAGE_ADDITIONAL_LIBS) libwebp_dll.lib
!endif

SDL_INCLUDES = /I..

# We build the SDL2_image with the playwave/playmus sample programs
SDL_IMAGE_LIB = $(CFG)\$(PLAT)\SDL2_image.lib
SDL_IMAGE_EXAMPLES = $(CFG)\$(PLAT)\showimage.exe

SDL_SAMPLE_BASE_LIBS = $(SDL_LIB) $(SDL_MAIN_LIB)
SDL_SAMPLE_LDFLAGS = $(LDFLAGS) /subsystem:console