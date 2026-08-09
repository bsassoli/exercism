module CollatzConjecture (collatz) where
collatz :: Integer -> Maybe Integer
collatz = helper 0


helper :: Integer -> Integer -> Maybe Integer
helper num step
  | num < 1 = Nothing
  | num == 1 = Just step
  | even num = helper (div num 2) (step + 1)
  | otherwise = helper (3 * num + 1) (step + 1)
