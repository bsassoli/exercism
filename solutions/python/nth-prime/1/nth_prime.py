from math import sqrt


def is_prime(n):
    if n < 2:
        return False
    return all(n % x != 0 for x in range(2, int(sqrt(n)) + 1))


def prime(n: int) -> list[int]:
    if not n:
        raise ValueError("there is no zeroth prime")
    candidate = 2
    ans = []
    while len(ans) < n:
        if is_prime(candidate):
            ans.append(candidate)
        candidate += 1
    return ans[-1]
