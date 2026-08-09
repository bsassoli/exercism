module CollatzConjecture exposing (collatz)

type Number = Even | Odd

getNumberType number = case modBy 2 number of
    0 -> Even
    _ -> Odd

collatzHelper: Int -> Int
collatzHelper start =
    if start == 1 then 0 else case getNumberType start of
        Even -> 1 + collatzHelper (start // 2) 
        _ -> 1 + collatzHelper (start * 3 + 1)

collatz : Int -> Result String Int
collatz start =
    if start < 1 then Err "Only positive integers are allowed"
    else Ok (collatzHelper start)
