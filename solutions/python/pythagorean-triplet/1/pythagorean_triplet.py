def triplets_with_sum(number):
    out = []
    for a in range(1, number // 3):
        b = (number ** 2 - 2 * number * a) / (2 * number - 2 * a)

        if b.is_integer():
            c = number - a - b
            if a*a + b*b == c*c and a < b < c:
                out.append([int(a), int(b), int(c)])
    return out

print(triplets_with_sum(840))
