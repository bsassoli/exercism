type nucleotide = A | C | G | T


let hamming_distance strand1 strand2 =  match ( List.length strand1, List.length strand2 ) with
    | (x, y) when x == y -> List.fold_left (+) 0 ( List.map2 ( fun x y -> if x <> y then 1 else 0 ) strand1 strand2 ) |> Result.ok
    | (0, _) -> Result.error "left strand must not be empty"
    | (_, 0) -> Result.error "right strand must not be empty"
    | _ -> Result.error "left and right strands must be of equal length"
