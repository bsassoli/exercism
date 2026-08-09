fun distance (strand1: string, strand2: string): int option =
    if size(strand1) <> size(strand2) then NONE else
    let
        val s1 = explode(strand1)
        val s2 = explode(strand2)
        fun compare_strands(s1: char list, s2: char list): int = 
        case s1 of
        [] => 0
        | x:: xs => 
            if x <> (hd s2) 
            then 1 + compare_strands(xs, (tl s2))
            else  compare_strands(xs, (tl s2))
            in 
                let val diff = compare_strands(s1, s2)
                in 
                case diff of 
                    0 => SOME 0
                    | _ => SOME diff
            end
    end