#include "isogram.h"
#include <string.h>
#include <ctype.h>

bool is_isogram(const char phrase[]) 
{
    if (phrase == NULL)
        return 0;
    int len = strlen(phrase);
    for (int i = 0; i < len - 1; i++) 
        if (isalpha(phrase[i]))
            for (int j = (i + 1); j < len; j++)
                if (tolower(phrase[i]) == tolower(phrase[j]))
                    return 0;
return 1;
}