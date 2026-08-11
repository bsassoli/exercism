module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)

import List exposing (foldl, map, range)

squareOfSum : Int -> Int
squareOfSum n =
    let
        square m = m * m
    in
        foldl  (+) 0 (range 1 n) |> square


sumOfSquares : Int -> Int
sumOfSquares n =
    let
        square m = m * m
    in
        foldl  (+) 0 (map square (range 1 n))


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n
