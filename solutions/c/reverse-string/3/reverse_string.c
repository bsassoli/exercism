#include "reverse_string.h"
#include <string.h>
#include <stdlib.h>


char *reverse(const char *value)
{
    int len = strlen(value);
    char *out = malloc(sizeof(char) * len + 1);

    for (int i=len-1; i>=0; i--)
    {
        char cp = value[i];
        out[len-i-1] = cp;
    }
    out[len] ='\0';
    return out;
}