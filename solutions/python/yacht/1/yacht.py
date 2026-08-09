# Score categories.
# Change the values as you see fit.


YACHT = 0
ONES = 1
TWOS = 2
THREES = 3
FOURS = 4
FIVES = 5
SIXES = 6
FULL_HOUSE = 7
FOUR_OF_A_KIND = 8
LITTLE_STRAIGHT = 9
BIG_STRAIGHT = 10
CHOICE = 11


def score(dice, category):
    if category == YACHT:
        if len(set(dice)) == 1:
            return 50
    if category in [ONES, TWOS, THREES, FOURS, FIVES, SIXES]:
        return sum(d for d in dice if d == category)
    if category == FULL_HOUSE:
        if len(set(dice)) == 2 and dice.count(dice[0]) in [2, 3]:
            return sum(dice)
        return 0
    if category == FOUR_OF_A_KIND:
        if len(set(dice)) in [1, 2] and dice.count(dice[0]) in [5, 4, 1]:
            die = [die for die in dice if dice.count(die) >= 4][0]
            return 4 * die
    if category == LITTLE_STRAIGHT:
        if sorted(dice) == [1, 2, 3, 4, 5]:
            return 30
    if category == BIG_STRAIGHT:
        if sorted(dice) == [2, 3, 4, 5, 6]:
            return 30
    if category == CHOICE:
        return sum(dice)
    return 0



dice = [6, 6, 4, 6, 6]
print(len(set(dice)) == 2 and dice.count(dice[0]) in [1, 4])
print(score(dice, FOUR_OF_A_KIND))
