

CC=gcc
C3C=c3c
CWARN=-w
CLIBS=-l:libraylib.a -lm
# CFLAGS=-pipe -O3 -march=native -flto
CFLAGS=-pipe -O0 -ggdb
C3CFLAGS=-O0 -g
INCLUDE=-I./raylib/src

RAYLIB_FLAGS=$(INCLUDE) -I./raylib/src/external/glfw/include -DPLATFORM_DESKTOP -D_GLFW_X11 -w $(CFLAGS) -fPIE

main: main.c3 intermediate/libraylib.a
	$(C3C) compile main.c3 -l ./intermediate/libraylib.a $(C3CFLAGS)

intermediate/rcore.o: raylib/src/rcore.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rcore.c -o intermediate/rcore.o

intermediate/rglfw.o: raylib/src/rglfw.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rglfw.c -o intermediate/rglfw.o

intermediate/rshapes.o: raylib/src/rshapes.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rshapes.c -o intermediate/rshapes.o

intermediate/rtext.o: raylib/src/rtext.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rtext.c -o intermediate/rtext.o

intermediate/rtextures.o: raylib/src/rtextures.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/rtextures.c -o intermediate/rtextures.o

intermediate/utils.o: raylib/src/utils.c
	$(CC) -c $(RAYLIB_FLAGS) raylib/src/utils.c -o intermediate/utils.o

intermediate/libraylib.a: intermediate/rcore.o intermediate/rglfw.o intermediate/rshapes.o intermediate/rtext.o intermediate/rtextures.o intermediate/utils.o
	ar rcs intermediate/libraylib.a intermediate/rcore.o intermediate/rglfw.o intermediate/rshapes.o intermediate/rtext.o intermediate/rtextures.o intermediate/utils.o





