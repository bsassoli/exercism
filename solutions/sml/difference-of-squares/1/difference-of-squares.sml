fun squareOfSum n = 
    let fun sumTo m = 
        case m of 
            0 => 0
            | _ => m + sumTo (m - 1)
    in let val s = sumTo n
    in s * s
    end
    end

fun sumOfSquares n = case n of 
    0 => 0
    | _ => (n * n ) + sumOfSquares(n -1)

fun differenceOfSquares n =
  squareOfSum n - sumOfSquares n


