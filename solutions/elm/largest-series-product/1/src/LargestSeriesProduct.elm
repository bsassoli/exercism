module LargestSeriesProduct exposing (largestProduct)


largestProduct : Int -> String -> Maybe Int
largestProduct span series =
    helper Nothing (String.toList series) span


helper : Maybe Int -> List Char -> Int -> Maybe Int
helper previous nums span =
    let
        firsts =
            List.take span nums
    in
    if List.length firsts /= span then
        previous

    else
        case charsToDigits firsts of
            Nothing ->
                Nothing

            Just digits ->
                let
                    current =
                        List.product digits

                    largest =
                        case previous of
                            Nothing ->
                                Just current

                            Just value ->
                                Just (max value current)
                in
                helper largest (List.drop 1 nums) span


charsToDigits : List Char -> Maybe (List Int)
charsToDigits chars =
    case chars of
        [] ->
            Just []

        c :: rest ->
            case ( charToDigit c, charsToDigits rest ) of
                ( Just digit, Just digits ) ->
                    Just (digit :: digits)

                _ ->
                    Nothing


charToDigit : Char -> Maybe Int
charToDigit c =
    if Char.isDigit c then
        Just (Char.toCode c - Char.toCode '0')

    else
        Nothing
