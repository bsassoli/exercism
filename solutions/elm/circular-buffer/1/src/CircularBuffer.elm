module CircularBuffer exposing (CircularBuffer, clear, new, overwrite, read, write)
import List exposing (length, filter)
import List exposing (isEmpty)


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
    case items of
        [ ] -> CircularBuffer capacity [element]
        [_] -> CircularBuffer capacity [element]
        _ :: rest -> CircularBuffer capacity (element :: rest)


read : CircularBuffer a -> Maybe ( a, CircularBuffer a )
read (CircularBuffer capacity items) =
    case items of
        [] -> Nothing
        [x] -> Just (x, CircularBuffer capacity [])
        oldest :: rest -> Just (oldest, CircularBuffer capacity rest)


clear : CircularBuffer a -> CircularBuffer a
clear (CircularBuffer capacity _)  =
    CircularBuffer capacity []
