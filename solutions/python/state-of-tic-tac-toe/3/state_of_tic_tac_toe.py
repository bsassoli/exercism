def gamestate(board):
    number_of_xs = sum(element == "X" for string in board for element in string)
    number_of_os = sum(element == "O" for string in board for element in string)

    if number_of_os > number_of_xs:
        raise ValueError("Wrong turn order: O started")
    if number_of_xs - number_of_os > 1:
        raise ValueError("Wrong turn order: X went twice")

    # board = [list(line) for line in board]
    is_full = all(element != " " for line in board for element in line)
    # collect horizontal lines
    lines = list(board)
    # collect vertical lines
    lines += [[line[col] for line in board] for col in range(len(board))]
    # collect diagonals
    lines.append([board[0][0], board[1][1], board[2][2]])
    lines.append([board[0][2], board[1][1], board[2][0]])
    x_wins = any(all(element == "X" for element in line) for line in lines)
    o_wins = any(all(element == "O" for element in line) for line in lines)
    x_moved_last = number_of_xs == number_of_os + 1
    if (x_wins and o_wins) or (x_wins and not x_moved_last) or (o_wins and x_moved_last):
        raise ValueError(
            "Impossible board: game should have ended after the game was won"
        )
    if x_wins or o_wins:
        return "win"
    if is_full:
        return "draw"
    return "ongoing"
