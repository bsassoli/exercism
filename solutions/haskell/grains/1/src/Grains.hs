module Grains (square, total) where

square :: Integer -> Maybe Integer
square n = if (n > 64 || n <= 0) then Nothing else Just (2 ^ (n - 1))

total :: Integer
total = sum
  (map (\x -> case square x of 
                Nothing -> 0
                Just v -> v) [1..64])


      

