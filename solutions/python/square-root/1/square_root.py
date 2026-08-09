def square_root(number):
    root = number / 2
    while abs(root ** 2 - number) > 10 ** (-10 ^ 6): 
        root = (root + number / root) / 2
    return root
