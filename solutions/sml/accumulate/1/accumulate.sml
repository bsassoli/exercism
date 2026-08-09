fun accumulate (f, xs) =
  let fun helper f' lst = 
    case lst of 
    [] => []
    | y::ys => f' y :: helper f' ys
in 
    helper f xs
end
