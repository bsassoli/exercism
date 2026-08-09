#include <stdio.h>
#include <math.h>
#include <stdbool.h>

bool is_armstrong_number(int candidate)
{
    int len = (int)(log10(candidate) + 1);
    int sum = 0;
    int exp;
    for (exp = len; exp > 0; --exp)
    {
        int digit = (int)((candidate % (int)pow(10, exp))) / pow(10, exp - 1);
        sum += pow(digit, len);
    }
    return sum == candidate;
}
