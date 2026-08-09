module SumOfMultiples (sumOfMultiples) where

import qualified Data.Set as Set


sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . removeDuplicates . concat $ [findFactors x limit | x <- factors]

removeDuplicates :: [Integer] -> [Integer]
removeDuplicates = Set.toList . Set.fromList 

findFactors :: Integer -> Integer -> [Integer]
findFactors m lim = [y * m  | y <- [1..lim], y * m < lim]
