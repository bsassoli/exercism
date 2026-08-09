module Leap exposing (isLeapYear)


isLeapYear : Int -> Bool
isLeapYear year =
    -- divby 4 | divby 100 | divby 400 |   Leap
    --    T    |      T    |    T      |    T  
    --    T    |      T    |    F      |    F
    --    T    |      F    |    T      |    T
    --    T    |      F    |    F      |    T
    --    F    |      T    |    T      |    F
    --    F    |      T    |    F      |    F
    --    F    |      F    |    T      |    F
    --    F    |      F    |    F      |    F
    -- A and (not B or C)

    modBy 4 year == 0 && (modBy 100 year /= 0 || modBy 400 year == 0)
