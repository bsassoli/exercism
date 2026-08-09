scores = {
    "AEIOULNRST": 1,
    "DG": 2,
    "BCMP": 3,
    "FHVWY": 4,
    "K": 5,
    "JX": 8,
    "QZ": 10
}
SCORES = {}
for key in scores:
    for alpha in key:
        SCORES.update({alpha: scores[key]})

def score(word):
    return sum(SCORES[char.upper()] for char in word)
