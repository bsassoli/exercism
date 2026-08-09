#include <stdio.h>
#include "collatz_conjecture.h"
int steps(int start);
int main(void);
int steps(int start) 
{
    if (start == 1) return 0;
    if (start % 2 == 0) return 1 + steps(start / 2);
    return 1 + steps(start * 3 + 1);
}
int main(void)
{
    printf("%d\n", steps(12));
}
