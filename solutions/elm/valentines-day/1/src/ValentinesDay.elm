module ValentinesDay exposing (..)

type Approval 
    = Yes
    | No
    | Maybe

type Cuisine 
    = Korean
    | Turkish


type Genre
    = Crime
    | Horror
    | Romance
    | Thriller

type Activity 
    = BoardGame
    | Chill
    | Movie Genre
    | Restaurant Cuisine

rateActivity : Activity -> Approval
rateActivity activity = 
    case activity of
    Chill -> No
    BoardGame -> No
    Movie g -> case g of 
        Romance -> Yes
        _ -> No
    Restaurant c -> case c of
        Korean -> Yes
        Turkish -> Maybe
