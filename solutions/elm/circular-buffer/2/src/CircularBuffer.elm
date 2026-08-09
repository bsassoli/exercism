module CircularBuffer exposing (CircularBuffer, clear, new, overwrite, read, write)
import List exposing (length)


type CircularBuffer a =
    CircularBuffer Int (List a)


new : Int -> CircularBuffer a
new capacity =
    CircularBuffer capacity []


write : a -> CircularBuffer a -> Maybe (CircularBuffer a)
write element (CircularBuffer capacity items) =
    if
        length items < capacity
    then
        Just (CircularBuffer capacity (items ++ [ element ]))
    else
        Nothing


overwrite : a -> CircularBuffer a -> CircularBuffer a
overwrite element (CircularBuffer capacity items) =
    if length items < capacity
    then (CircularBuffer capacity (items ++ [ element ]))
    else
        case
            items
        of
            [] -> (CircularBuffer capacity [])
            _ :: rest -> CircularBuffer capacity ( rest ++ [ element ])


read : CircularBuffer a -> Maybe ( a, CircularBuffer a )
read (CircularBuffer capacity items) =
    case items of
        [] -> Nothing
        [x] -> Just (x, CircularBuffer capacity [])
        fst :: rest -> Just (fst, CircularBuffer capacity rest)


clear : CircularBuffer a -> CircularBuffer a
clear (CircularBuffer capacity _)  =
    CircularBuffer capacity []
