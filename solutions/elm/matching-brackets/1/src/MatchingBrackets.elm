module MatchingBrackets exposing (isPaired)


isPaired : String -> Bool
isPaired input =
    String.toList input
        |> List.foldl step (Just [])
        |> (==) (Just [])


step : Char -> Maybe (List Char) -> Maybe (List Char)
step char stack =
    case stack of
        Nothing ->
            Nothing

        Just s ->
            if isOpening char then
                Just (char :: s)

            else if isClosing char then
                case s of
                    top :: rest ->
                        if matches top char then
                            Just rest

                        else
                            Nothing

                    [] ->
                        Nothing

            else
                Just s


isOpening : Char -> Bool
isOpening c =
    List.member c [ '(', '[', '{' ]


isClosing : Char -> Bool
isClosing c =
    List.member c [ ')', ']', '}' ]


matches : Char -> Char -> Bool
matches open close =
    (open == '(' && close == ')')
        || (open == '[' && close == ']')
        || (open == '{' && close == '}')
