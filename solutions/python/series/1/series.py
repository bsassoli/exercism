def slices(series, length):
    end = len(series)
    if not length:
        raise ValueError("slice length cannot be zero")
    if length < 0:
        raise ValueError("slice length cannot be negative")
    if not series:
        raise ValueError("series cannot be empty")
    if length > end:
        raise ValueError("slice length cannot be greater than series length")
    i = 0
    j = length
    out = []
    while j <= end:
        out.append(series[i:j])
        i += 1
        j += 1
    return out
