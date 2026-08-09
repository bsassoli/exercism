import string

def abbreviate(words):
    return "".join(word[0].upper() for word in words.replace("-", " ").strip().translate(str.maketrans("","", string.punctuation)).split(" ") if word != "")
