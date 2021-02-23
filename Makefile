TARGET = hpb_bot_mm
ARCHFLAG = march=i686
BASEFLAGS = -Dstricmp=strcasecmp -Dstrcmpi=strcasecmp

OPTFLAGS = -mtune=generic -mmmx -msse -msse2 -O2 -m32 -mfpmath=sse -pipe -s \
		-Wno-write-strings -falign-loops=2 -falign-jumps=2 -falign-functions=2 \

SDKTOP = ../metamod-p
HLSDK = ../hlsdk-2.3-p4/multiplayer
CPPFLAGS = ${BASEFLAGS} ${OPTFLAGS} -${ARCHFLAG} -w -I$(SDKTOP)/metamod \
            -I$(HLSDK)/common -I$(HLSDK)/dlls -I$(HLSDK)/engine -I$(HLSDK)/pm_shared

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
	g++ -fPIC -shared -o $@ ${OBJ} -ldl -lm

clean:
	rm -f *.o
	rm -f *.so

%.o:	%.cpp
	g++ ${CPPFLAGS} -c $< -o $@
