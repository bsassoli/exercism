module TopScorers exposing (..)

import Dict exposing (Dict)
import TopScorersSupport exposing (PlayerName)


updateGoalCountForPlayer : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
updateGoalCountForPlayer playerName playerGoalCounts =
    Dict.update playerName (\x -> case x of 
        Just goals ->  Just (goals + 1) 
        Nothing -> Just 1)
    playerGoalCounts


aggregateScorers : List PlayerName -> Dict PlayerName Int
aggregateScorers playerNames = 
    List.foldl updateGoalCountForPlayer Dict.empty playerNames 


removeInsignificantPlayers : Int -> Dict PlayerName Int -> Dict PlayerName Int
removeInsignificantPlayers goalThreshold playerGoalCounts =
    Dict.filter (\_ goals -> goals >=  goalThreshold) playerGoalCounts

resetPlayerGoalCount : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
resetPlayerGoalCount playerName playerGoalCounts =
    Dict.insert playerName 0 playerGoalCounts


formatPlayer : PlayerName -> Dict PlayerName Int -> String
formatPlayer playerName playerGoalCounts =
    case Dict.get playerName playerGoalCounts of
        Just goals -> playerName ++ ": " ++ String.fromInt goals
        Nothing ->  playerName ++ ": " ++ String.fromInt 0


formatPlayers : Dict PlayerName Int -> String
formatPlayers players =
    Dict.map (\player _ -> formatPlayer player players) players |> Dict.values |> String.join ", "


combineGames : Dict PlayerName Int -> Dict PlayerName Int -> Dict PlayerName Int
combineGames game1 game2 = Dict.merge
        (\name count mergedCounts -> Dict.insert name count mergedCounts)
        (\name countA countB mergedCounts -> Dict.insert name (countA + countB) mergedCounts)
        (\name count mergedCounts -> Dict.insert name count mergedCounts)
        game1
        game2
        Dict.empty
