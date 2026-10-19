def gamestate(board):
    number_of_Xs = sum([el == "X" for string in board for el in string])
    number_of_Os = sum([el == "O" for string in board for el in string])
    if number_of_Os > number_of_Xs:
        raise ValueError("Wrong turn order: O started")
    if number_of_Xs - number_of_Os > 1:
        raise ValueError("Wrong turn order: X went twice")

    # board = [list(line) for line in board]
    isFull = all(el != " " for line in board for el in line)
    # collect horizontal lines
    lines = board
    # collect vertical lines
    lines += [[line[col] for line in board] for col in range(len(board))]
    # collect diagonals
    lines.append([board[0][0], board[1][1], board[2][2]])
    lines.append([board[0][2], board[1][1], board[2][0]])
    x_wins = any(all(el == "X" for el in line) for line in lines)
    o_wins = any(all(el == "O" for el in line) for line in lines)
    if x_wins and o_wins:
        raise ValueError(
            "Impossible board: game should have ended after the game was won"
        )
    if x_wins or o_wins:
        return "win"
    if isFull:
        return "draw"
    return "ongoing"
