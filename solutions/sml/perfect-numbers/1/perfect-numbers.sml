datatype classification = Abundant | Deficient | Perfect

fun factors (input: int) =
    let fun helper (start: int, target: int) =
        if Real.fromInt start >= Math.sqrt(Real.fromInt target)
        then []
        else
            if target mod start = 0
            then
                let val remainder = target div start
                in                    
                    if remainder <> start andalso remainder <> input
                    then remainder::start::helper (start + 1, target)
                    else start::helper (start + 1, target)
                end
            else helper (start + 1, target)
    in helper(1, input)
    end

fun aliquot_sum number =
    foldl (fn (a,b) => a + b)  0 (factors number)


fun classify (input: int): classification option =
        if  input <= 0 then NONE else
            let val aliquot = aliquot_sum input in
                if aliquot = input
                then SOME Perfect
                else
                    if aliquot > input
                    then SOME Abundant
                    else SOME Deficient
            end
