module Allergies exposing (Allergy(..), isAllergicTo, toList)


import Bitwise exposing (and)
type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate 
    | Pollen
    | Cats


toNumber: Allergy -> Maybe Int
toNumber allergy =  
    case allergy of
        Eggs -> Just 1
        Peanuts -> Just 2
        Shellfish -> Just 4
        Strawberries -> Just 8
        Tomatoes -> Just 16
        Chocolate -> Just 32
        Pollen -> Just 64
        Cats -> Just 128
    


toAllergy: Int -> Maybe Allergy
toAllergy number = 
  case number of
    1 -> Just Eggs
    2 -> Just Peanuts
    4 -> Just Shellfish
    8 -> Just Strawberries
    16 -> Just Tomatoes
    32 -> Just Chocolate 
    64 -> Just Pollen
    128 -> Just Cats
    _ -> Nothing


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    case toNumber allergy of
        Just number -> (and number score) == number
        Nothing -> False
    
 
helper start score = 
    if 
        start < 1
    then
        []
    else
        let allergy = toAllergy start in
            case allergy of 
                Nothing -> []
                Just a -> 
                    if 
                        isAllergicTo a score
                    then
                        a :: helper (start // 2) (score - start)
                    else  helper (start // 2) score

        
toList : Int -> List Allergy
toList score =
    helper 128 score
