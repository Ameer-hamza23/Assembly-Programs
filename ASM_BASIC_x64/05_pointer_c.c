#include <stdio.h>

extern void asm_change_value(int *value);


int main( int argc, char *argv[] ) {

    int value = 10;
    printf("Value before asm_change_value: %d\n", value);

    asm_change_value(&value);

    printf("Value after asm_change_value: %d\n", value);

    return 0;
}