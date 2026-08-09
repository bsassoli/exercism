module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

removeDuplicates :: [Integer] -> [Integer]
removeDuplicates = nub

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . removeDuplicates . concat $ [findFactors x limit | x <- factors]


findFactors :: Integer -> Integer -> [Integer]
findFactors m lim = [y * m  | y <- [1..lim], y * m < lim]
