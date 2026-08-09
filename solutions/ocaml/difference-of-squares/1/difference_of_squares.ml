let square_of_sum n = 
    let rec sumTo m = 
        match m with
            | 0 -> 0
            | _ -> m + sumTo (m - 1)
    in let s = sumTo n
    in s * s

let rec sum_of_squares n = match n with 
    | 0 -> 0
    | _ -> (n * n ) + sum_of_squares (n -1)

let difference_of_squares n =
    square_of_sum n - sum_of_squares n
