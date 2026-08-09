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
        check = None
        for value in sorted(list(VALUES.keys()), reverse=True):
            if number >= value:
                check = value
        if check:
            out += VALUES[check]
            number = number - check
    return out
