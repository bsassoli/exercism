def is_isogram(string):
    string = [char for char in string.lower().strip() if char.isalpha()]
    return len(string) == len(set(string))
