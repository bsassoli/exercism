from collections import Counter

def is_isogram(string):
    c = Counter([char for char in string.lower().strip() if char.isalpha()])
    return all(v < 2 for v in c.values())
