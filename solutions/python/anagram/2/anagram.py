
def find_anagrams(word, candidates):
    candidates = filter(lambda candidate: (sorted(word.lower()) == sorted(candidate.lower()) and candidate.lower() != word.lower()), candidates)
    return candidates
                
