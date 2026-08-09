fun append (list1: int list, list2: int list): int list =
    case list1 of
    [] => list2
    | x::xs => x::append(xs, list2)

fun concat (lists: int list list): int list =
  case lists of 
  [] => []
  | x::xs => case x of 
    [] => concat(xs)
    |_ => hd x::append(tl x, concat(xs))

fun reverse (list: int list): int list =
  case list of
  [] => []
  | x::xs => append(reverse(xs), [x])

fun filter (function: int -> bool, list: int list): int list =
  case list of 
  [] => []
  | x::xs => if function(x) then x::filter(function, xs) else filter(function, xs)

fun map (function: int -> int, list: int list): int list =
  case list of
  [] => []
  | x::xs => function(x)::map(function, xs)

fun length (ns: int list): int =
  case ns of 
    [] => 0
    | x::xs => 1 + length(xs)

fun foldl (function: int * int -> int, initial: int, list: int list): int =
  case list of 
  [] => initial
  | x::xs => foldl(function, function(initial, x), tl list)

fun foldr (function: int * int -> int, initial: int, list: int list): int =
  let val reversed = reverse(list) in
    case reversed of
     [] => initial
    | x::xs => foldr(function, function(x, initial), tl reversed)
  end