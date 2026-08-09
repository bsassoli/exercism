module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = yearIsDivisibleBy 4 &&
  (not (yearIsDivisibleBy 100)  || yearIsDivisibleBy 400)
  where
    yearIsDivisibleBy :: Integer -> Bool
    yearIsDivisibleBy m = year `rem` m == 0

