module BlorkemonCards exposing
    ( Card
    , compareShinyPower
    , expectedWinner
    , isMorePowerful
    , maxPower
    , sortByCoolness
    , sortByMonsterName
    )


type alias Card =
    { monster : String, power : Int, shiny : Bool }


isMorePowerful : Card -> Card -> Bool
isMorePowerful card1 card2 =
    card1.power > card2.power


maxPower : Card -> Card -> Int
maxPower card1 card2 =
    max card1.power card2.power


sortByMonsterName : List Card -> List Card
sortByMonsterName cards =
    List.sortBy (\card -> card.monster) cards

compareShiny: Card -> Card -> Order
compareShiny card1 card2 = 
    case (card1.shiny, card2.shiny) of 
        (False, True) -> LT
        (True, False) -> GT
        _ -> EQ


comparePower: Card -> Card -> Order
comparePower card1 card2 = 
    if isMorePowerful card1 card2 then GT
    else if (card1.power < card2.power) then LT
    else EQ


compareCoolness: Card -> Card -> Order
compareCoolness card1 card2 = 
    let comparison = compareShiny card1 card2 
    in
    if comparison == EQ
    then comparePower card1 card2 else comparison


sortByCoolness : List Card -> List Card
sortByCoolness cards =
    List.sortWith compareCoolness cards |> List.reverse
    

compareShinyPower : Card -> Card -> Order
compareShinyPower card1 card2 =
    let powerComparison = comparePower card1 card2 in
    case powerComparison of
        EQ -> compareShiny card1 card2
        _ -> powerComparison
    


expectedWinner : Card -> Card -> String
expectedWinner card1 card2 = case compareShinyPower card1     card2 of
    EQ -> "too close to call"
    GT -> card1.monster
    LT -> card2.monster
