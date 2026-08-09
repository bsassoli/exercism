def primes(limit):
    initial_list = list([n, m] for (n, m) in zip(range(2, limit + 1),\
                                                 "U" * limit))
    print(initial_list)
    start = 0
    while start < len(initial_list) - 1:
        prime = initial_list[start][0]
        multiple = prime * 2
        ix = start + 1
        while ix < len(initial_list):
            if initial_list[ix][0] == multiple:
                initial_list[ix][1] = "M"
                multiple += prime
            ix += 1
        start += 1
    return [item[0] for item in initial_list if item[1] != "M"]

