module ResistorColorTrio exposing (Color(..), label, value)
import List exposing (map, take, repeat, head)
import String exposing (fromInt)

type Color
    = Black
    | Brown
    | Red
    | Orange
    | Yellow
    | Green
    | Blue
    | Violet
    | Grey
    | White

type Prefix
    = Peta
    | Tera
    | Giga
    | Mega
    | Kilo


colorCode : Color -> Int
colorCode color =
    case color of
        Black -> 0
        Brown -> 1
        Red -> 2
        Orange -> 3
        Yellow -> 4
        Green -> 5
        Blue -> 6
        Violet -> 7
        Grey -> 8
        White -> 9


findPrefix : Int -> Maybe Prefix
findPrefix n =
        case
            n
        of
            15 -> Just Peta
            12 -> Just Tera
            9 -> Just Giga
            6 -> Just Mega
            3 -> Just Kilo
            _ -> Nothing

prefixToString : Prefix ->  String
prefixToString p =
    case
        p
    of
        Peta -> "petaohms"
        Tera -> "teraohms"
        Giga -> "gigaohms"
        Mega -> "megaohms"
        Kilo -> "kiloohms"


fromZerosToPrefix : Int -> String
fromZerosToPrefix n =
    let
        exp = round (logBase 10 (toFloat n))
    in
        case
            findPrefix exp
        of
            Just p -> prefixToString p
            Nothing -> String.join "" (repeat n "0") ++ " ohms"

value : List Color -> Int
value colors =
     take 2 colors
    |> map colorCode
    |> List.foldl (\digit acc -> acc * 10 + digit) 0


label : List Color -> String
label colors =
    let
        third = head (take 3 colors)
    in
    case
        third
    of
        Just h -> fromInt (value colors) ++ fromZerosToPrefix (10 ^ colorCode h)
        _ -> ""
