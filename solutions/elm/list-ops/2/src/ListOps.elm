module ListOps exposing
    ( append
    , concat
    , filter
    , foldl
    , foldr
    , length
    , map
    , reverse
    )


length : List a -> Int
length list =
    case list of 
    [] -> 0
    _::xs -> 1 + length xs


reverse : List a -> List a
reverse list =
    case list of 
    [] -> []
    x::xs -> case xs of 
        [] -> [x]
        _ -> append (reverse xs) [x]


foldl : (a -> b -> b) -> b -> List a -> b
foldl f acc list =
    case list of
        [] -> acc
        x :: xs -> foldl f (f x acc) xs


foldr : (a -> b -> b) -> b -> List a -> b
foldr f acc list =
    foldl f acc (reverse list)


map : (a -> b) -> List a -> List b
map f list =
    case list of 
    [] -> []
    x::xs ->  f x :: (map f xs)


filter : (a -> Bool) -> List a -> List a
filter f list =
    case list of 
    [] -> []
    x::xs ->  
        if 
            f x
        then 
            x :: (filter f xs) 
        else 
            (filter f xs)

append : List a -> List a -> List a
append xs ys =
    xs ++ ys


concat : List (List a) -> List a
concat list =
    case list of
    [] -> []
    x::xs -> append x (concat xs)

