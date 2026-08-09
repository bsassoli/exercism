#include <math.h>
#include <stdbool.h>
#include <stdlib.h>
#include "queen_attack.h"

bool is_valid_position(position_t queen);
bool occupy_same_position(position_t queen_1, position_t queen_2);
bool same_diagonal(position_t queen_1, position_t queen_2);
attack_status_t can_attack(position_t queen_1, position_t queen_2);

bool is_valid_position(position_t queen)
{
    return queen.row < 8 && queen.column < 8;
}

bool occupy_same_position(position_t queen_1, position_t queen_2)
{
    return queen_1.row == queen_2.row && queen_1.column == queen_2.column;
}

bool same_diagonal(position_t queen_1, position_t queen_2)
{
    return abs(queen_1.row - queen_2.row) == abs(queen_1.column - queen_2.column);
}

attack_status_t can_attack(position_t queen_1, position_t queen_2)
{

    if (!occupy_same_position(queen_1, queen_2)
        && is_valid_position(queen_1) 
        && is_valid_position(queen_2))
    {
        if (queen_1.row == queen_2.row
            || queen_1.column == queen_2.column
            || same_diagonal(queen_1, queen_2))
        {
            return CAN_ATTACK;
        }
        else return CAN_NOT_ATTACK;
    }
    return INVALID_POSITION;
    
}
