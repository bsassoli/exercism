NUMERALS_0_9 = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
NUMERALS_10_19 = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
NUMERALS_0_19 = NUMERALS_0_9 + NUMERALS_10_19

TENS_NUMERALS = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
SCALE_NUMERALS = ["", "thousand", "million", "billion", "trillion"]

def say(number):
    if number < 0 or number >= 10**12:
        raise ValueError("input out of range")

    if number == 0:
        return "zero"

    if number < 20:
        return NUMERALS_0_19[number]

    if number < 100:
        rest = number % 10
        if rest == 0:
            return TENS_NUMERALS[number // 10 - 2]
        return TENS_NUMERALS[number // 10 - 2] + "-" + NUMERALS_0_9[rest]

    if number < 1000:
        rest = number % 100
        if rest == 0:
            return NUMERALS_0_9[number // 100] + " hundred"
        return NUMERALS_0_9[number // 100] + " hundred " + say(rest)

    for i in reversed(range(len(SCALE_NUMERALS))):
        unit = 1000 ** i
        if number >= unit:
            quotient = number // unit
            remainder = number % unit
            if remainder == 0:
                return say(quotient) + " " + SCALE_NUMERALS[i]
            else:
                return say(quotient) + " " + SCALE_NUMERALS[i] + " " + say(remainder)

    raise ValueError("input out of range")

