from math import sqrt, floor


def factors(value):
    primes = []
    while not value % 2:
        value //= 2
        primes.append(2)
    i = 3
    while i <= value:
        if not value % i:
            primes.append(i)
            value //= i
        else:
            i += 2
    return primes
