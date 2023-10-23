#include "z.h"

int b = 0;

int repeatNtimes(int n)
{
    for (int i = 0; i < n; i++)
    {
        b++;
    }
    return b;
}