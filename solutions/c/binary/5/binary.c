#include "binary.h"
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <ctype.h>

#define MAX 500

int convert(const char *input)
{
    int ans = 0;
    int numDigits = strlen(input) - 1;
    for (int p = numDigits; p >= 0; p--)
    {
        int curr = input[numDigits - p] - '0';
        if (curr < 0 || curr > 1)
            return -1;
        ans += curr * pow(2, p);
    }
    return ans;
}