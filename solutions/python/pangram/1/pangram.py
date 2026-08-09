import string

def is_pangram(sentence):
    def helper (list, sentence):
        if not len(list):
            return True
        if not list[0] in sentence.lower():
            return False
        return helper(list[1: ], sentence)
    alphabet = list(string.ascii_lowercase)
    return helper(alphabet, sentence)
