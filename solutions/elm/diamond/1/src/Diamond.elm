module Diamond exposing (rows)

import Char
import List
import String


rows : Char -> String
rows target =
    let
        maxIndex =
            Char.toCode target - Char.toCode 'A'

        line index =
            let
                letter =
                    Char.fromCode (Char.toCode 'A' + index)
                        |> String.fromChar

                outerSpaces =
                    String.repeat (maxIndex - index) "_"

                middleSpaces =
                    String.repeat (2 * index - 1) "_"

                content =
                    if index == 0 then
                        letter

                    else
                        letter ++ middleSpaces ++ letter
            in
            outerSpaces ++ content ++ outerSpaces

        top =
            List.range 0 maxIndex
                |> List.map line

        bottom =
            top
                |> List.take maxIndex
                |> List.reverse
    in
    String.join "\n" (top ++ bottom)
