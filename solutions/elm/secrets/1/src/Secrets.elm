module Secrets exposing (clearBits, decrypt, flipBits, setBits, shiftBack)
import Bitwise

shiftBack amount value =
    Bitwise.shiftRightZfBy amount value


setBits mask value =
    Bitwise.or mask value


flipBits mask value =
    Bitwise.xor mask value


clearBits mask value =
    Bitwise.and value (Bitwise.complement mask) 


decrypt secret =
    setBits 1996 secret |> flipBits 1996 |> shiftBack 5 |> clearBits 33

