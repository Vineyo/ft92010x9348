obj-m += ft9201.o
CC=gcc -I/usr/include/ImageMagick-7 -I/usr/include/x86_64-linux-gnu/ImageMagick-7
util_objs = util_main.o
LIBS = -L/usr/lib/x86_64-linux-gnu -lMagickWand-7.Q16HDRI
PWD:= $(CURDIR)

incs ="-I/usr/include/ImageMagick-7 -I/usr/include/x86_64-linux-gnu/ImageMagick-7"

all: build ft9201_util ft9201_util_new

ft9201_util: util_main.o
	gcc -I/usr/include/ImageMagick-7 -I/usr/include/x86_64-linux-gnu/ImageMagick-7 util_main.c -o ./ft9201_util -L/usr/lib/x86_64-linux-gnu -lMagickWand-7.Q16HDRI

ft9201_util_clean:
	rm -Rf util_main.o $(util_objs) *.ko *.o *.mod.o ft9201_util fingprint

ft9201_util_new: fingprint.o lodepng.o
	 gcc -o fingprint fingprint.c lodepng.c -ansi -pedantic -Wall -Wextra -O3

build:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

install: build
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules_install

clean: ft9201_util_clean
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
