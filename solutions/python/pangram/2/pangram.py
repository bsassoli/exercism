def is_pangram(sentence):
    return len(set([ch.lower() for ch in sentence if ch.isalpha()])) == 26
