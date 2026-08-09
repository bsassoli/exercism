let divisible_by n by = n mod by == 0
let drop n b s = if divisible_by n b then s else ""
let pling num = drop num 3 "Pling"
let plang num = drop num 5 "Plang"
let plong num = drop num 7 "Plong"
let raindrop num =
  match pling num ^ plang num ^ plong num with
  | "" ->  string_of_int num
  | x -> x
