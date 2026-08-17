module Bob exposing (hey)

import Char
import String


hey : String -> String
hey message =
    let
        trimmed =
            String.trim message

        isQuestion =
            String.endsWith "?" trimmed

        isYelling =
            hasLetters trimmed
                && String.all (\c -> not (Char.isLower c)) trimmed
    in
    if String.isEmpty trimmed then
        "Fine. Be that way!"

    else if isYelling && isQuestion then
        "Calm down, I know what I'm doing!"

    else if isYelling then
        "Whoa, chill out!"

    else if isQuestion then
        "Sure."

    else
        "Whatever."


hasLetters : String -> Bool
hasLetters text =
    String.any Char.isAlpha text
