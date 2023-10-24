#include "z.h"
#include "x.h"
#include "v.h"

int main(void)
{
    while(1)
    {
        int a = 0;
        int b = 0;
        int c = 0;

        a = repeatNtimes(5);
        b = repeatNtimes(10);

        c = add(a, b);
        c = subtract(c, a);
        c = multiply(a, a);
        c = divide(c, a);
        c = square(a);
        c = cube(a);

        c = subtract_new(c, a);
        c = multiply_new(a, b);
        c = divide_new(c, c);
        c = square_new(b);
        c = cube_new(c);
    }

    return 0;
}