TARGET = hpb_bot_mm
ARCHFLAG = march=i686
BASEFLAGS = -Dstricmp=strcasecmp -Dstrcmpi=strcasecmp

OPTFLAGS = -mtune=generic -msse -msse2 -O2 -m32 -mfpmath=sse -Wno-write-strings \
		-falign-loops=2 -falign-jumps=2 -falign-functions=2 \

SDKTOP = ../metamod-p-37
CPPFLAGS = ${BASEFLAGS} ${OPTFLAGS} -${ARCHFLAG} -w -I$(SDKTOP)/metamod -I$(SDKTOP)/hlsdk/common -I$(SDKTOP)/hlsdk/dlls -I$(SDKTOP)/hlsdk/engine -I$(SDKTOP)/hlsdk/pm_shared

OBJ = 	bot.o \
	bot_chat.o \
	bot_client.o \
	bot_combat.o \
	bot_models.o \
	bot_navigate.o \
	bot_start.o \
	dll.o \
	engine.o \
	h_export.o \
	util.o \
	waypoint.o

${TARGET}.so: ${OBJ}
	g++-4.8 -fPIC -shared -o $@ ${OBJ} -ldl -lm

clean:
	rm -f *.o
	rm -f *.so

%.o:	%.cpp
	g++-4.8 ${CPPFLAGS} -c $< -o $@
