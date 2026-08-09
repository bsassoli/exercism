datatype allergen = Eggs
| Peanuts
| Shellfish
| Strawberries
| Tomatoes
| Chocolate
| Pollen
| Cats

fun getAllergen(number: int): allergen option =
        case number of
        1 => SOME Eggs
        | 2 => SOME Peanuts
        | 4 => SOME  Shellfish
        | 8 => SOME Strawberries
        | 16 => SOME Tomatoes
        | 32 => SOME Chocolate
        | 64 => SOME Pollen
        | 128 => SOME Cats
        | _ => NONE

fun getScore(a: allergen): word option =
        case a of
            Eggs => SOME (Word.fromInt 1)
        | Peanuts => SOME (Word.fromInt 2)
        | Shellfish => SOME (Word.fromInt 4)
        | Strawberries => SOME (Word.fromInt 8)
        | Tomatoes => SOME (Word.fromInt 16)
        | Chocolate => SOME (Word.fromInt 32)
        | Pollen => SOME (Word.fromInt 64)
        | Cats => SOME (Word.fromInt 128)

fun allergicTo (score: int) (a: allergen): bool =
        case getScore a of
            SOME v => Word.andb (v, Word.fromInt score) = v
        | NONE => false


fun allergies (score: int): allergen list =
        let    fun helper (start: int, running_score: int) =
                    if
                        start < 1
                    then
                        []
                    else
                        let val candidate = getAllergen(start)
                        in
                            case candidate of
                                SOME v => if allergicTo running_score v
                                    then v :: helper(start div 2, running_score - start)
                                    else helper(start div 2, running_score)
                                | NONE => raise Empty
                        end
        in rev (helper (128, score))
        end
