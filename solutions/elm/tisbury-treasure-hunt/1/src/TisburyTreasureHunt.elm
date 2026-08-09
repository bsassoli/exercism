module TisburyTreasureHunt exposing (..)

-- Consider defining a type alias for TreasureLocation,
-- Treasure, PlaceLocation and Place,
-- and using them in the function type annotations

type alias Place = String
type alias Treasure = String
type alias TreasureLocation = (Int, Char)
type alias PlaceLocation = (Char, Int)


placeLocationToTreasureLocation : ( Char, Int ) -> ( Int, Char )
placeLocationToTreasureLocation placeLocation =
    (Tuple.second placeLocation, Tuple.first placeLocation)


treasureLocationMatchesPlaceLocation : ( Char, Int ) -> ( Int, Char ) -> Bool
treasureLocationMatchesPlaceLocation placeLocation treasureLocation =
     placeLocationToTreasureLocation placeLocation == treasureLocation


countPlaceTreasures : ( String, ( Char, Int ) ) -> List ( String, ( Int, Char ) ) -> Int
countPlaceTreasures place treasures =
    let location = Tuple.second place
    in case treasures of
        [] -> 0
        [x] -> if treasureLocationMatchesPlaceLocation location (Tuple.second x)
                then 1 else 0
        x::xs -> if treasureLocationMatchesPlaceLocation location (Tuple.second x)
                then 1 + countPlaceTreasures place xs else countPlaceTreasures place xs


specialCaseSwapPossible : ( String, TreasureLocation ) -> ( String, PlaceLocation ) -> ( String, TreasureLocation ) -> Bool
specialCaseSwapPossible ( foundTreasure, _ ) ( place, _ ) ( desiredTreasure, _ ) =
    case (foundTreasure, place, desiredTreasure) of
        ("Brass Spyglass", "Abandoned Lighthouse", _) -> True
        ("Amethyst Octopus", "Stormy Breakwater", "Crystal Crab") -> True
        ("Amethyst Octopus", "Stormy Breakwater", "Glass Starfish") -> True
        ("Vintage Pirate Hat", "Harbor Managers Office", "Model Ship in Large Bottle") -> True
        ("Vintage Pirate Hat", "Harbor Managers Office", "Antique Glass Fishnet Float") -> True
        _ -> False
