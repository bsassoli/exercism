module SumOfMultiples exposing (sumOfMultiples)
import Set exposing (Set)

getMultiplesLessThan: Int -> Int -> Int -> List Int
getMultiplesLessThan start target limit =
    if start >= limit
    then []
    else
        if
            modBy target start == 0
        then
            start :: getMultiplesLessThan (start + 1) target limit 
        else getMultiplesLessThan (start + 1) target limit


getAllMultiples: List Int ->  Int -> List (Set Int)
getAllMultiples divisors limit = 
    case divisors of
        [] -> []
        x::xs -> (Set.fromList (getMultiplesLessThan 0 x limit)) :: getAllMultiples xs limit

flattenAllMultiples: List (Set Int) -> List Int
flattenAllMultiples sets =
    List.foldl Set.union Set.empty sets
    |> Set.toList 


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    if
        List.isEmpty divisors
    then
        0
    else
         getAllMultiples divisors limit
        |> flattenAllMultiples
        |> List.foldl (+) 0 
        
