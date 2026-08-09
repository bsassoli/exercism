from itertools import combinations, permutations


def equilateral(sides):
    return check(sides) and sides[0] == sides[1] == sides[2]


def isosceles(sides):
    return check(sides) and any(a==b for (a, b) in combinations(sides, 2))


def scalene(sides):
    return check(sides) and not (equilateral(sides) or isosceles(sides)) 


def check(sides):
    return all(side != 0 for side in sides) and all(a + b >= c for (a, b, c) in set(permutations(sides, 3)))