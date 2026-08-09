module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs = 
  let replace c = case c of 
        'C' -> Right 'G'
        'G' -> Right 'C'
        'T' -> Right 'A'
        'A' -> Right 'U'
        otherwise -> Left c
  in mapM replace xs
