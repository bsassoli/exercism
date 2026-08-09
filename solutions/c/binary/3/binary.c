#include "binary.h"
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <ctype.h>

#define MAX 500

void revstr(char *str);
int convert(const char *input);
int main(void);
int main(void)
{
    char *arr="1101";
    printf("%d\n", convert(arr));
}

int convert(const char *input)
{
    int ans = 0;
    int numDigits = strlen(input) - 1;
    for (int p = numDigits; p >= 0; p--)
    {
        int curr = input[numDigits - p] - '0';
        printf("%d", curr);
        if (curr < 0 || !isdigit(curr) || curr > 1)
            return -1;
        ans += curr * pow(2, p);
    }
    return ans;
}

void revstr(char *str)
{
    int end = strlen(str) - 1;
    for (int i = 0; i <= end; i++)
    {
        char temp = str[i];
        str[i] = str[end - i];
        str[end - i] = temp;
    }
}

