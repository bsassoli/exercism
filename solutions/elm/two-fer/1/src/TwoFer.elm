module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name = case name of 
    Just x -> "One for " ++ x ++ ", one for me."
    Nothing -> "One for you, one for me."
