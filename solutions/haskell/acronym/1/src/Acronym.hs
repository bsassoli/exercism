module Acronym (abbreviate) where

    import qualified Data.Text as T
    import Data.Char (isUpper, isAlpha, isSpace)

    removePunctuation :: String -> String
    removePunctuation = filter (\c -> isAlpha c || c == '-' || isSpace c)

    capitalizeUpperWords :: [String] -> [String]
    capitalizeUpperWords = map (\w -> if all isUpper w then take 1 w else w)

    splitOnUppercase :: String -> [String]
    splitOnUppercase [] = []
    splitOnUppercase (x:xs) = case break isUpper xs of
                            (word, [])     -> [x:word | not (null (x:word))]
                            (word, y:rest) -> (x:word) : splitOnUppercase (y:rest)


    mySplit :: T.Text -> [T.Text]
    mySplit = filter (not . T.null) . T.split (\c -> c == ' ' || c == '-')


    abbreviate :: String -> String
    abbreviate xs =  T.unpack $ T.intercalate  (T.pack "") $ map (T.singleton . T.head. T.toUpper) $ mySplit $ T.pack (unwords $ splitOnUppercase . removePunctuation $ unwords (capitalizeUpperWords $ words xs))
