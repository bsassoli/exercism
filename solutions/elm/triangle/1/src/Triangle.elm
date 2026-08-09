module Triangle exposing (Triangle(..), triangleKind)
import Set exposing (Set)

type Triangle
    = Equilateral
    | Isosceles
    | Scalene



triangleKind: number -> number -> number -> Result String Triangle
triangleKind a b c = 
    if 
        List.any (\side -> side <= 0 ) [a, b, c] 
    then 
        Err "Invalid lengths"
    else if
        ((a + b >=c) &&
        (b + c >= a) &&
        (a + c >= b))
    then
        (case getKind a b c of
            Just triangle -> Ok triangle
            Nothing -> Err "Cant'parse"
        ) 
    else Err "Violates inequality"

getKind : number -> number -> number -> Maybe Triangle
getKind x y z =
    let length = Set.fromList [x, y, z] |> Set.toList |> List.length in case length of 
    1 -> Just Equilateral
    2 -> Just Isosceles
    3 -> Just Scalene
    _ -> Nothing
