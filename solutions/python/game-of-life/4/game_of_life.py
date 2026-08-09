def tick(matrix):
    if not matrix:
        return matrix
    mat = [[None for _ in row] for row in matrix]
    for row_ix in range(len(matrix)):
        for col_ix in range(len(matrix[0])):
            cell = matrix[row_ix][col_ix]
            neighbours = get_neighbors(matrix, row_ix, col_ix)
            mat[row_ix][col_ix] = change_cell_state(neighbours, cell)
    return mat


def get_neighbors(matrix, row, col):
    rows = []

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
    to_check = sum(neighbours)
    return cell and to_check in [2, 3] or ((not cell) and to_check == 3)
