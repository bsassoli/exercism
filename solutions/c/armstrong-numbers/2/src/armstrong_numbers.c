#include "armstrong_numbers.h"
#include <stdio.h>
#include <math.h>
#include <stdbool.h>

bool is_armstrong_number(int candidate)
{
    int len = candidate > 0 ? (int)(log10(candidate) + 1) : 0;
    int sum = 0;
    for (int exp = len; exp > 0; --exp)
    {
        int digit = (candidate / (int)pow(10, exp)) % 10;
        sum += pow(digit, len);
    }
    return sum == candidate;
}
