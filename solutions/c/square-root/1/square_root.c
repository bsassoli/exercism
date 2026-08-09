#include "square_root.h"
#include <math.h>
#include <stdlib.h>
#define PRECISION 0.01

int square_root(int n)
{
    int root = n;
    while (abs(root * root - n) > PRECISION)
        {
            root = (root + (n / root)) / 2;
        }
    return root;
}