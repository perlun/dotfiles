#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Prints the provided command line parameter in decimal form, like this: 72 101 108 108 111 32 87 111 114 108 100
int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Syntax: %s <string>\n", argv[0]);
        exit(1);
    }

    for (int i = 0; i < strlen(argv[1]); i++) {
        printf("%02d ", argv[1][i]);
    }

    printf("\n");
}

