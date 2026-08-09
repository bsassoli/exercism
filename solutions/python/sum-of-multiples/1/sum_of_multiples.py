def sum_of_multiples(limit, multiples):
    acc = []
    for step in range(1, limit):
        for multiple in set(filter(lambda x: x!= 0, multiples)):
            if step % multiple == 0:
                acc.append(step)
    return sum(set(acc))
