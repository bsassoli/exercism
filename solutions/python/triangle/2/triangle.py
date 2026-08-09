from itertools import combinations, permutations


def equilateral(sides):
    return check(sides) and len(set(sides))==1


def isosceles(sides):
    return check(sides) and len(set(sides))<=2


def scalene(sides):
    return check(sides) and len(set(sides))==3


def check(sides):
    return all(side != 0 for side in sides) and all(a + b >= c for (a, b, c) in set(permutations(sides, 3)))