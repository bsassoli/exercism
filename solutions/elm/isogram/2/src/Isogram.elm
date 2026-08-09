module Isogram exposing (isIsogram)
import Set

isIsogram : String -> Bool
isIsogram sentence =
    String.toLower sentence
    |> String.toList
    |> List.filter Char.isAlpha
    |> \finalList -> List.length finalList == Set.size     (Set.fromList finalList)
