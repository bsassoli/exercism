module Bob (responseFor) where
import Data.Char

responseFor :: String -> String
responseFor "" = "Fine. Be that way!"
responseFor sentence
  | null stripped = "Fine. Be that way!"
  | isYelled && isQuestion = "Calm down, I know what I'm doing!"
  | isQuestion = "Sure."
  | isYelled = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    stripped = filter (not . isSpace) sentence
    isQuestion = last stripped == '?'
    isYelled = all isUpper (filter isLetter stripped) && any isLetter sentence
