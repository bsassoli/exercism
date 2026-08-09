fun keep f l = List.filter (fn x => f x) l
fun discard f l = List.filter (fn x => not (f x)) l
