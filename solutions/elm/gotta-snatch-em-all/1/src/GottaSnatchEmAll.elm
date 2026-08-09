module GottaSnatchEmAll exposing (..)

import Set exposing (Set)
import Tuple exposing (..)


type alias Card =
    String


newCollection : Card -> Set Card
newCollection card =
    Set.singleton card


addCard : Card -> Set Card -> ( Bool, Set Card )
addCard card collection =
    (Set.member card collection, Set.insert card collection)


tradeCard : Card -> Card -> Set Card -> ( Bool, Set Card )
tradeCard yourCard theirCard collection =
    (Set.member yourCard collection && not (Set.member theirCard collection) , Set.insert theirCard (Set.remove yourCard collection))


removeDuplicates : List Card -> List Card
removeDuplicates cards =
    Set.fromList cards |> Set.toList 


extraCards : Set Card -> Set Card -> Int
extraCards yourCollection theirCollection =
    Set.diff yourCollection theirCollection 
    |> Set.toList
    |> List.length


extendOperation : List (Set Card) -> (Set Card -> Set Card -> Set Card) -> Set Card
extendOperation collection fun = case collection of
    [] -> Set.empty
    [x] -> x 
    [x,y] -> fun x y
    x::xs ->  fun x  (extendOperation xs fun)


intersectHelper : List (Set Card) -> Set Card
intersectHelper coll = (extendOperation coll Set.intersect)

unionHelper : List (Set Card) -> Set Card
unionHelper coll = (extendOperation coll Set.union)


boringCards : List (Set Card) -> List Card
boringCards collections =
    Set.toList (intersectHelper collections)
    |> List.sort


totalCards : List (Set Card) -> Int
totalCards collections =
    Set.toList (unionHelper collections)
    |> List.length


splitShinyCards : Set Card -> ( List Card, List Card )
splitShinyCards collection = 
    Set.partition (\card -> String.startsWith "Shiny" card) collection
        |> Tuple.mapBoth Set.toList Set.toList