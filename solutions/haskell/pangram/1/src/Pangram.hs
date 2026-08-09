module Pangram (isPangram) where
import Data.Char (toUpper)

isPangram :: String -> Bool
--- isPangram text = all (\x -> x `elem` [toLower c | c <- text, c /= ' ']) ['a'..'z']
isPangram text = all (`elem` map toUpper text) ['A'..'Z']
