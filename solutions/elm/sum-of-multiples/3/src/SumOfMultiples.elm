module SumOfMultiples exposing (sumOfMultiples)
import Set exposing (Set)


getMultiplesLessThan: Int -> Int -> Int -> List Int
getMultiplesLessThan start target limit =
    if
        start >= limit
    then
        []
    else
        if
            modBy target start == 0
        then
             start :: (getMultiplesLessThan (start + 1) target limit)
        else
            getMultiplesLessThan (start + 1) target limit


getAllMultiples: List Int ->  Int -> List Int
getAllMultiples divisors limit =
    let 
        divs = case divisors of
            [] -> []
            x::xs -> getMultiplesLessThan 1 x limit ++ getAllMultiples xs limit
    in divs |> Set.fromList |> Set.toList 


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
         getAllMultiples divisors limit
        |> List.foldl (+) 0
