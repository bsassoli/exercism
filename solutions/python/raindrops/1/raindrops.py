def convert(number):
    res = ""
    if number % 3 == 0:
        res += "Pling"
    if number % 5 == 0:
        res += "Plang"
    if number % 7 == 0:
        res += "Plong"
    elif not(number % 3 == 0 or number % 5 == 0 or number % 7 == 0):
        res = number   
    return str(res)

