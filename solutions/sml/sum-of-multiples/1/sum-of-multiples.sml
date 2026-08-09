fun sum (factors: int list, limit: int): int =
  let fun helper(facts: int list, count: int, start: int) =
      if start = limit then count else
            case facts of
                (*  we checked all the factors so we go to next number *)
                [] => helper(factors, count, start + 1)
                | x::xs => if start mod x = 0
                            (*  we found a multiple so we keep checking and accumulate *)
                            then helper(factors, count + start, start + 1)
                            (* we found a multiple so we keep checking but don't accumulate *)
                            else helper(xs, count, start)
    in helper(factors, 0, 1)
    end
