#include "grains.h"
#include <math.h>



uint64_t square(uint8_t index)
{
        return pow(2, index - 1);
}

uint64_t total(void)
{    
    uint64_t all_squares = 0;    
    for (int i = 1; i < 65; i++)
    {
        all_squares += square(i);
    }
    return all_squares;
}