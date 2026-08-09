import string
import re
from collections import Counter


def count_words(sentence):
    PUNCT = string.punctuation.replace("'", "").split()
    PUNCT = r"[\s" + "".join(PUNCT) + "]"
    sentence = sentence.lower()
    pattern = r"'(?!\w)|(?<!\w)'"
    sentence = re.sub(pattern, '', sentence)
    lst = re.split(PUNCT, sentence)
    lst = filter(lambda x: x != "", lst)
    return dict(Counter(lst))
