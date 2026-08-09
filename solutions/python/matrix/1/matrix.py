class Matrix:
    def __init__(self, matrix_string):
        self.string = matrix_string

    def row(self, index):
        return list(map(int, [item.split(" ") for item in self.string.split("\n")][index - 1]))

    def column(self, index):
        return list(map(int, (list(zip(*[item.split(" ") for item in list(self.string.split("\n"))]))[index-1])))
