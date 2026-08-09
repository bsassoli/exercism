#include "hamming.h"
#include "string.h"
#include "ctype.h"


int compute(const char *lhs, const char *rhs)
{
    int acc = 0;
    size_t len_first = strlen(lhs);
    size_t len_second = strlen(rhs);
    if (len_first != len_second)
        return -1;
    if (len_first == 0 || len_second == 0)
        return 0;
    for (size_t i=0; i<=len_first; i++)
    {
        if (lhs[i] != rhs[i]) 
            acc++;
    }
    return acc;
}