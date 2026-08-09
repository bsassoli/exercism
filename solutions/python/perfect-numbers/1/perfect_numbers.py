import math

def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number <= 0:
        raise ValueError("Classification is only possible for positive integers.")
    print(get_divisors(number))
    aliquot_sum = sum(get_divisors(number))
    if aliquot_sum == number: 
        return "perfect"
    if aliquot_sum < number:
        return "deficient"
    return "abundant"

def get_divisors(n):
    i = 1
    ans = []
    while i <= math.sqrt(n):
        if (n % i == 0) :
            # If divisors are equal, print only one
            if (n / i == i) :
                ans.append(i)
            else :
                # Otherwise print both
                ans.append(i)
                ans.append(int(n/i))
        i = i + 1
    ans.sort()
    return ans[:-1]