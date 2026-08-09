def is_valid(isbn):
    split_isbn = [digit for digit in isbn.replace("-", "")]
    if len(split_isbn)==10:
        if all(digit.isdigit() for digit in split_isbn[:-1]):
            if split_isbn[-1] == "X":
                return (sum([int(split_isbn[j]) * (10 - j) for j in range(9)]) + 10) % 11 == 0
            elif isbn[-1].isdigit():                
                return sum([int(split_isbn[j]) * (10-j) for j in range(10)]) % 11 == 0
            return False
        return False
    return False
