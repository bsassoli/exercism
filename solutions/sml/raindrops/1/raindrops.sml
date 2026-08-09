fun convert n =
  let
        fun isDivisibleBy d n = n mod d = 0
        
        val sounds = [
            (3, "Pling"),
            (5, "Plang"),
            (7, "Plong")
        ]
        
        fun addSound ((divisor, sound), acc) =
            if isDivisibleBy divisor n then acc ^ sound
            else acc
        
        val result = List.foldl addSound "" sounds
    in
        if result = "" then Int.toString n
        else result
    end