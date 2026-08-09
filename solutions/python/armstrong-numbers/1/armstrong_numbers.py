def is_armstrong_number(number):
    
    digits = list(map(int, str(number)))
    length = len(digits)
    return sum(digits[i] ** length for i in range(length)) == number
