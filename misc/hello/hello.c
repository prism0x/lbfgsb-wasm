#include <stdio.h>

void timestamp_();
void multiply_fortran_(int *, int *, int *);
int main()
{
    int a = 10;
    int b = 20;
    int c;
    // printf() displays the string inside quotation
    printf("Hello, World!\n");
    // fflush(stdout);
    multiply_fortran_(&a, &b, &c);
    printf("Fortran code computed this: %d * %d = %d\n", a, b, c);

    return 0;
}