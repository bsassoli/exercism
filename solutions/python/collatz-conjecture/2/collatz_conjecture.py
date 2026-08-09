def steps(number):
    if number < 1:
        raise ValueError("Only positive integers are allowed")
    if number == 1:
        return 0
    number = number / 2 if not number % 2  else 1 + 3 * number
    return 1 + steps(number)
