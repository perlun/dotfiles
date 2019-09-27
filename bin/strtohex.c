#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Prints the provided command line parameter in hex form, like this: 48 65 6c 6c 6f 20 57 6f 72 6c 64
int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Syntax: %s <string>\n", argv[0]);
        exit(1);
    }

    for (int i = 0; i < strlen(argv[1]); i++) {
        printf("%02x ", argv[1][i]);
    }

    printf("\n");
}

