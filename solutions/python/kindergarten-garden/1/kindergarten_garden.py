PUPILS = "Alice, Bob, Charlie, David, Eve, Fred, Ginny, Harriet, Ileana, Joseph, Kincaid, Larry".split(", ")
SEEDS = {"C": "Clover", "G": "Grass", "R": "Radishes", "V": "Violets"}

class Garden:
    def __init__(self, diagram, students=PUPILS):
        self.diagram = diagram
        self.students = {k: v for (v, k) in enumerate(sorted(students))}

    def plants(self, student):
        position = self.students[student] * 2
        seeds = []
        for row in self.diagram.split("\n"):
            seeds += row[position]
            seeds += row[position + 1]
        return [SEEDS[seed] for seed in seeds]
