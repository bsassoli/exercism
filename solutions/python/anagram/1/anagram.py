
def find_anagrams(word, candidates):
    ans = []
    candidates = [candidate for candidate in candidates if (len(candidate) == len(word) and candidate.lower() != word.lower())]
    for candidate in candidates:
        if all(candidate.lower().count(char) == word.lower().count(char) for char in candidate.lower()):
            ans.append(candidate)
    return set(ans)
                
