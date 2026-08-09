def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands must be of equal length.")
    if not len(strand_a):
        return 0
    return sum([list(strand_a)[ix] != list(strand_b)[ix] for ix in range(len(strand_a))])
