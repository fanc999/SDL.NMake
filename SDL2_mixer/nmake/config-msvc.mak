# NMake Makefile portion for enabling features for Windows builds

# You may change these lines to customize the .lib files that will be linked to

# Please do not change anything beneath this line unless maintaining the NMake Makefiles
# Bare minimum features and sources built into FLAC on Windows
BASE_CFLAGS =	\
	$(CFLAGS)	\
	/DWIN32		\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS

SDL_MIXER_CFLAGS =	\
	$(BASE_CFLAGS)	\
	/DMUSIC_MID_NATIVE	\
	/DMUSIC_MID_TIMIDITY	\
	/DMUSIC_WAV

SDL_LIB = SDL2.lib
SDL_MAIN_LIB = SDL2main.lib

SDL_MIXER_ADDITIONAL_LIBS = $(SDL_LIB) winmm.lib

!if "$(FLAC)" == "1"
SDL_MIXER_CFLAGS = $(SDL_MIXER_CFLAGS) /DMUSIC_FLAC
SDL_MIXER_ADDITIONAL_LIBS = $(SDL_MIXER_ADDITIONAL_LIBS) flac.lib
!endif

!if "$(OGG)" == "1"
SDL_MIXER_CFLAGS = $(SDL_MIXER_CFLAGS) /DMUSIC_OGG
SDL_MIXER_ADDITIONAL_LIBS = $(SDL_MIXER_ADDITIONAL_LIBS) vorbisfile.lib vorbis.lib ogg.lib
!endif

!if "$(MIKMOD)" == "1"
SDL_MIXER_CFLAGS = $(SDL_MIXER_CFLAGS) /DMUSIC_MOD_MIKMOD
SDL_MIXER_ADDITIONAL_LIBS = $(SDL_MIXER_ADDITIONAL_LIBS) mikmod.lib
!endif

!if "$(MODPLUG)" == "1"
SDL_MIXER_CFLAGS = $(SDL_MIXER_CFLAGS) /DMUSIC_MOD_MODPLUG
SDL_MIXER_ADDITIONAL_LIBS = $(SDL_MIXER_ADDITIONAL_LIBS) modplug.lib
!endif

!if "$(FLUIDSYNTH)" == "1"
SDL_MIXER_CFLAGS = $(SDL_MIXER_CFLAGS) /DMUSIC_MID_FLUIDSYNTH
SDL_MIXER_ADDITIONAL_LIBS = $(SDL_MIXER_ADDITIONAL_LIBS) fluidsynth.lib
!endif

!if "$(MP3)" == "1"
SDL_MIXER_CFLAGS = $(SDL_MIXER_CFLAGS) /DMUSIC_MP3_MPG123
SDL_MIXER_ADDITIONAL_LIBS = $(SDL_MIXER_ADDITIONAL_LIBS) libmpg123.lib
!endif

SDL_INCLUDES = /I..\include

# We build the SDL2_mixer with the playwave/playmus sample programs
SDL_MIXER_LIB = $(CFG)\$(PLAT)\SDL2_mixer.lib
SDL_MIXER_EXAMPLES = $(CFG)\$(PLAT)\playwave.exe $(CFG)\$(PLAT)\playmus.exe

SDL_SAMPLE_BASE_LIBS = $(SDL_LIB) $(SDL_MAIN_LIB)
SDL_SAMPLE_LDFLAGS = $(LDFLAGS) /subsystem:console