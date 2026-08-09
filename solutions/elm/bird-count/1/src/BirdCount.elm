module BirdCount exposing (busyDays, incrementDayCount, hasDayWithoutBirds, today, total)


today : List Int -> Maybe Int
today counts =
    case
        counts
    of
     [] -> Nothing
     d :: _ -> Just d


incrementDayCount : List Int -> List Int
incrementDayCount counts =
    case
        counts
    of
     [] -> [1]
     d :: rest -> d + 1 :: rest


hasDayWithoutBirds : List Int -> Bool
hasDayWithoutBirds counts =
    case counts of
        [] -> False
        [x] -> x == 0
        first :: rest ->
            if first == 0
            then True
            else hasDayWithoutBirds rest


total : List Int -> Int
total counts =
    case counts of
        [] -> 0
        [x] -> x
        first :: rest ->
            first + total rest


busyDays : List Int -> Int
busyDays counts =
    let
        isBusy x  = if x >=5 then 1 else 0
    in
        case counts of
            [] -> 0
            [x] -> isBusy x
            first :: rest ->
                isBusy first + busyDays rest
