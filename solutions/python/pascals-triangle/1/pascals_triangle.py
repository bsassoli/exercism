def rows(row_count):
    if row_count < 0:
        raise ValueError("number of rows is negative")
    if not row_count:
        return []
    if row_count == 1:
        return [[1]]
    prev = rows(row_count-1)
    return prev + [[1] + [
        prev[-1][a]+
        prev[-1][b]
        for a, b in zip(
            range(len(prev[-1])-1),
            range(1, len(prev[-1])),
        )
    ] + [1]]
