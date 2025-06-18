obj-m += ft9201.o
CC=gcc
LIBS = -L/usr/lib/x86_64-linux-gnu -lMagickWand-7.Q16HDRI
PWD:= $(CURDIR)
CFLAGS = -ansi -pedantic -Wall -Wextra -O3
incs =

all: build ft9201_util fingprint

build:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

install: build
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules_install
.PHONY = clean
clean: ft9201_util_clean
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

ft9201_util: util_main.o
	$(CC) $(incs) $(LIBS) $? -o $@
util_main.o: util_main.c
	$(CC) $(incs) $(LIBS) -c $? -o $@
fingprint.o: fingprint.c
	$(CC) $(incs) $(LIBS) -c $? -o $@
lodepng.o :lodepng.c
	$(CC) $(incs) $(LIBS) -c $? -o $@
ft9201_util_clean:
	rm -Rf util_main.o *.ko *.o *.mod.o ft9201_util fingprint

fingprint: fingprint.o lodepng.o
	 $(CC) $(CFLAGS) $? -o ?@
