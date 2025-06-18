#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <unistd.h>

#define MAGICKCORE_HDRI_ENABLE 1
#define MAGICKCORE_QUANTUM_DEPTH 16
#include "ft9201.h"
#include <math.h>

int main(int argc, char* argv[])
{
    printf("FT9201 utility program\n");

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <device_file> [action]\n", argv[0]);
        return -1;
    }

    char* device_file_name = argv[1];
    struct ft9201_status device_status;

    printf("Device: %s\n", device_file_name);

    fprintf(stderr, "status struct: %p\n", &device_status);

    printf("Initializing device\n");

    return 0;
}
