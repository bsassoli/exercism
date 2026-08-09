#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length)
{
    if (length == 0) 
    {
        return NULL; // Base case: Value not found
    }
    
    size_t mid_point = length / 2;
    const int *mid = arr + mid_point;
    int candidate = *mid;
    
    if (candidate == value) 
    {
        return mid;
    }
    
    else 
    {
        if (candidate > value)
        {
            return binary_search(value, arr, mid_point);
        }
    }
        return binary_search(value, mid + 1, length - mid_point - 1);
}
