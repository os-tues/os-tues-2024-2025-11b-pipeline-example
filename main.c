#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    if (argc != 2) {
        fprintf(stderr, "Invalid number of arguments.\n");
        return 1;
    }

    int num = atoi(argv[1]);
    printf("%d\n", num * num);
    return 0;
}
