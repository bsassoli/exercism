fun isEven num = 
    if num mod 2 = 0 then true else false;

fun collatz n =
    let fun helper (n, acc)  =
        case n of
        NONE => NONE
        | SOME num => 
        if num < 1 then NONE
        else 
            if num = 1 then SOME acc
            else 
                if (isEven num) = true then helper (SOME (num div 2), acc + 1) else helper (SOME (num * 3  + 1), acc + 1)
    in 
        helper (SOME n, 0)
    end
