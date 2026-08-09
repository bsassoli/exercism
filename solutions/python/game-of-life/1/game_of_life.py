def tick(matrix):
    M = [[None for _ in range(len(matrix[0]))] for _ in range(len(matrix))]
    print(M)
    if not matrix:
        return matrix
    for row_ix in range(len(matrix)):
        for col_ix in range(len(matrix[0])):
            cell = matrix[row_ix][col_ix]
            neighbours = get_neighbors(matrix, row_ix, col_ix)
            M[row_ix][col_ix] = change_cell_state(neighbours, cell)
    return M


def get_neighbors(matrix, row, col):
    rows = []
    # above
    if row > 0:
        if col > 0:
            rows.append(matrix[row-1][col-1])
        rows.append(matrix[row-1][col])
        if col < len(matrix[0]) - 1:
            rows.append(matrix[row-1][col+1])
    if col > 0:
        rows.append(matrix[row][col-1])
    if col < len(matrix[0]) - 1:
        rows.append(matrix[row][col+1])
    if row < len(matrix) - 1:
        if col > 0:
            rows.append(matrix[row+1][col-1])
        rows.append(matrix[row+1][col])
        if col < len(matrix) - 1:
            rows.append(matrix[row+1][col+1])
    return rows


def change_cell_state(neighbours, cell):
    if cell:
        if sum(neighbours) in [2, 3]:
            return 1
    if sum(neighbours) == 3:
        return 1
    return 0

matrix = [
            [1, 1, 0],
            [0, 0, 0],
            [1, 0, 0],
        ]

n = get_neighbors(matrix, 1, 0)
print(n)
print(change_cell_state(n, matrix[1]))
print(tick(matrix))

