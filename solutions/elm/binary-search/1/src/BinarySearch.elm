module BinarySearch exposing (find)

import Array exposing (Array)


find : Int -> Array Int -> Maybe Int
find target xs = 
    let
        currentIndex = (Array.length xs) // 2
    in
        case Array.get currentIndex xs of
            Nothing -> Nothing    
            Just currentCandidate -> 
                if 
                    currentCandidate == target 
                then 
                    Just currentIndex
                else 
                    if
                        currentCandidate > target
                    then
                        find target (Array.slice 0 currentIndex xs)
                    else
                        Maybe.map (\x -> currentIndex + x + 1) (find target (Array.slice (currentIndex + 1) (Array.length xs) xs))