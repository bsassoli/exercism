class HighScores:
    def __init__(self, scores):
        self.scores = scores

    def latest(self):
        return self.scores[-1]

    def personal_best(self):
        return sorted(self.scores)[-1]

    def personal_top_three(self):
        sorted_scores = sorted(self.scores)
        ix = 0
        out = []
        while sorted_scores and ix < 3:
            out.append(sorted_scores.pop())
            ix += 1
        return out
