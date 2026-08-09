module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.Maybe (fromMaybe)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)


charToNucleotide :: Char -> Maybe Nucleotide
charToNucleotide c
  | c == 'A' = Just A
  | c == 'C' = Just C
  | c == 'G' = Just G
  | c == 'T' = Just T
  | otherwise = Nothing

-- Count nucleotides in a string, returning an error for invalid characters
nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = 
    let nucleotideList = mapM charToNucleotide xs
    in case nucleotideList of
        Nothing   -> Left "Invalid nucleotide detected in the input string."
        Just nucleotides -> Right $ countNucleotides nucleotides

-- Helper function to count occurrences of each nucleotide
countNucleotides :: [Nucleotide] -> Map Nucleotide Int
countNucleotides = foldr (\c -> Map.insertWith (+) c 1) Map.empty
