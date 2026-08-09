def tick(matrix):
    return [
        [
            next_cell_state(get_neighbors(matrix, r, c), cell)
            for c, cell in enumerate(row)
         ]
        for r, row in enumerate(matrix)
    ]


def get_neighbors(matrix, row, col):
    n_rows, n_cols = len(matrix), len(matrix[0])
    return [
        matrix[r][c]
        for r in range(max(0, row - 1), min(n_rows, row + 2))
        for c in range(max(0, col - 1), min(n_cols, col + 2))
        if (r, c) != (row, col)
    ]


def next_cell_state(neighbours, cell):
    to_check = sum(neighbours)
    return to_check == 3 or (cell and to_check in [2, 3])
