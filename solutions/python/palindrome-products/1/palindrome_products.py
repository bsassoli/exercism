from itertools import combinations_with_replacement
from functools import lru_cache


def get_products(min_factor, max_factor):
    return combinations_with_replacement(range(min_factor, max_factor + 1), 2)


@lru_cache(maxsize=1000)
def get_palindromes(min_factor, max_factor):
    palindromes = {}
    for x, y in get_products(min_factor, max_factor):
        prod = x * y
        text_prod = str(prod)
        if text_prod == text_prod[::-1]:
            if prod not in palindromes:
                palindromes[prod] = [(x, y)]
            else:
                palindromes[prod].append((x, y))
    return sorted([(k,  v) for k, v in palindromes.items()], key = lambda tup: tup[0])


def largest(min_factor, max_factor):
    """Given a range of numbers, find the largest palindromes which
       are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
             Iterable should contain both factors of the palindrome in an arbitrary order.
    """
    if min_factor <= max_factor:
        if get_palindromes(min_factor, max_factor):
            return get_palindromes(min_factor, max_factor)[-1]
        return (None, [])
    raise ValueError("min must be <= max")


def smallest(min_factor, max_factor):
    """Given a range of numbers, find the smallest palindromes which
    are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
    Iterable should contain both factors of the palindrome in an arbitrary order.
    """
    if min_factor <= max_factor:
        if get_palindromes(min_factor, max_factor):
            return get_palindromes(min_factor, max_factor)[0]
        return (None, [])
    raise ValueError("min must be <= max")
