from itertools import zip_longest

def saddle_points(matrix):
    # max_col_len = max(len(row) for row in matrix)
    cols = list(zip_longest(*matrix, fillvalue=0))
    # if the matrix is irregular
    if any(len(row) != len(matrix[0]) for row in matrix):
        raise ValueError("irregular matrix")
    saddle_points = []
    for row_ix in range(len(matrix)):
        for col_ix in range(len(matrix[row_ix])):
            element = matrix[row_ix][col_ix]
            if element == max(matrix[row_ix]) and element == min(cols[col_ix]):
                saddle_points.append({"row": row_ix + 1, "column": col_ix + 1})
    return saddle_points
