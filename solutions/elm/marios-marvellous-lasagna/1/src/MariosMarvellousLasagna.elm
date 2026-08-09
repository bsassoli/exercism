module MariosMarvellousLasagna exposing (remainingTimeInMinutes)

-- TODO: define the remainingTimeInMinutes function

remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers numberOfMinutesInOven = 
    let 
        expectedMinutesInOven = 40
        preparationTimeInMinutes lasagnaLayers = 2 * lasagnaLayers
    in 
    (preparationTimeInMinutes layers) + expectedMinutesInOven - numberOfMinutesInOven
