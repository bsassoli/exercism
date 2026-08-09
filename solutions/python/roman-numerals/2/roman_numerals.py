VALUES = {
    1000: "M",
    900: "CM",
    500: "D",
    400: "CD",
    100: "C",
    90: "XC",
    50: "L",
    40: "XL",
    10: "X",
    9: "IX",
    5: "V",
    4: "IV",
    1: "I"
}


def roman(number):
    out = ""
    while number > 0:
        check = helper(number, list(VALUES.keys()))
        if check:
            out += VALUES[check]
            number = number - check
    return out


def helper(number, values):
    for value in sorted(values, reverse=True):
        if number >= value:
            return value
    return


print(roman(1))  # I
print(roman(5))  # V
print(roman(6))  # VI
print(roman(12))  # XII
print(roman(19))  # XIX