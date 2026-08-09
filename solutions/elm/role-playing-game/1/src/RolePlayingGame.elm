module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
    Nothing -> "Mighty Magician"
    Just player -> player


revive : Player -> Maybe Player
revive player =
    let { health, level } = player 
    in case (health, level) of
    (0, 10) -> Just { player | health = 100, mana = Just 100 }
    (0, _) -> Just {player | health = 100, mana = Nothing }
    _ -> Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
    Nothing -> ({ player | health = if player.health - manaCost > 0 then player.health - manaCost else 0} , 0)
    Just manaValue -> if manaValue >= manaCost then ({ player | mana = Just (manaValue - manaCost) } , manaCost * 2) else (player, 0) 

