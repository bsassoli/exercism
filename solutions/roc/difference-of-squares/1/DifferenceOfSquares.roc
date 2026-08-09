module [squareOfSum, sumOfSquares, differenceOfSquares]

squareOfSum = \n ->
    Num.powInt (List.sum (List.range {start: At 1, end: At n})) 2

sumOfSquares = \n ->
    List.sum (List.map (List.range {start: At 1, end: At n}) (\x -> Num.powInt x 2))

differenceOfSquares = \n ->
    a = sumOfSquares n
    b = squareOfSum n
    b - a
