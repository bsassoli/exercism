module CustomSet exposing
    ( diff
    , disjoint
    , empty
    , equal
    , fromList
    , insert
    , intersect
    , isEmpty
    , member
    , subset
    , toList
    , union
    )

import List


type Set
    = Empty
    | Set (List Int)


empty : Set
empty =
    Empty


insert : Int -> Set -> Set
insert element set =
    fromList (element :: toList set)


toList : Set -> List Int
toList set =
    case set of
        Empty ->
            []

        Set elements ->
            elements


fromList : List Int -> Set
fromList elements =
    let
        dedup element unique =
            if List.member element unique then
                unique

            else
                element :: unique

        normalized =
            List.foldl dedup [] elements
                |> List.sort
    in
    case normalized of
        [] ->
            Empty

        _ ->
            Set normalized


isEmpty : Set -> Bool
isEmpty set =
    case set of
        Empty ->
            True

        Set _ ->
            False


member : Int -> Set -> Bool
member element set =
    List.member element (toList set)


equal : Set -> Set -> Bool
equal set1 set2 =
    toList set1 == toList set2


union : Set -> Set -> Set
union set1 set2 =
    fromList (toList set1 ++ toList set2)


intersect : Set -> Set -> Set
intersect set1 set2 =
    toList set1
        |> List.filter (\element -> member element set2)
        |> fromList


diff : Set -> Set -> Set
diff set1 set2 =
    toList set1
        |> List.filter (\element -> not (member element set2))
        |> fromList


subset : Set -> Set -> Bool
subset set1 set2 =
    toList set1
        |> List.all (\element -> member element set2)


disjoint : Set -> Set -> Bool
disjoint set1 set2 =
    intersect set1 set2
        |> isEmpty
