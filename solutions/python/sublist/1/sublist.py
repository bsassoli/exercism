"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

# Possible sublist categories.
# Change the values as you see fit.
SUBLIST = 1
SUPERLIST = 2
EQUAL = 3
UNEQUAL = 0

def sublist(list_a, list_b):
    if list_a == list_b:
        return EQUAL
    if len(list_a) > len(list_b):
        if is_sublist(list_b, list_a):
            return SUPERLIST
    elif len(list_a) < len(list_b):
        if is_sublist(list_a, list_b):
            return SUBLIST
    return UNEQUAL

def is_sublist(smaller, larger):
    if not smaller:
        return True
    for i in range(len(larger) - len(smaller) + 1):
        if larger[i:i+len(smaller)] == smaller:
            return True
    
    return False