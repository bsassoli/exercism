module Go exposing (..)

import GoSupport exposing (..)

applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game

applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    let rules = game
            |> oneStonePerPointRule
            |> Result.map captureRule
            |> Result.andThen libertyRule
            |> Result.andThen koRule
            |> Result.map changePlayer
    in
        case rules of
            Ok newGame -> newGame
            Err err -> {game | error = err }


        
