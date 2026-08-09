module TracksOnTracksOnTracks exposing (..)
import List exposing (reverse, length)

newList : List String
newList =
    []


existingList : List String
existingList =
     [ "Elm", "Clojure", "Haskell" ]


addLanguage : String -> List String -> List String
addLanguage language languages =
    language :: languages


countLanguages : List String -> Int
countLanguages languages =
    length languages


reverseList : List String -> List String
reverseList languages =
    reverse languages


excitingList : List String -> Bool
excitingList languages = case languages of
    "Elm" :: _ -> True
    _ :: "Elm" :: _ -> countLanguages languages <= 3
    _  -> False
