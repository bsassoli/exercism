from operator import itemgetter


class School:
    def __init__(self):
        self.students = []
        self._names = set()
        self.grades = {}
        self._added = []

    def add_student(self, name, grade):
        if name not in self._names:
            self.students.append((name, grade))
            if grade not in self.grades:
                self.grades[grade] = [name]
            else:
                self.grades[grade].append(name)
            self._added.append(True)
            self._names.add(name)
        else:
            self._added.append(False)

    def roster(self):
        self.students.sort(key=itemgetter(1, 0))
        return [name for name, _ in self.students]

    def grade(self, grade_number):
        return sorted(self.grades[grade_number]) if grade_number in self.grades else []

    def added(self):
        return self._added
