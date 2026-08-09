fun toRna (dna: string): string option =
    let
        fun translate c = 
            case c of
                #"G" => #"C"
                | #"C" => #"G"
                | #"T" => #"A"
                | #"A" => #"U"
                | _ => raise Fail "Invalid DNA nucleotide"
        
        fun transcribe [] = ""
          | transcribe (c::cs) = 
            String.str(translate c) ^ transcribe cs
            handle Fail _ => raise Fail "Invalid DNA strand"
    in 
        SOME (transcribe (explode dna))
        handle Fail _ => NONE
    end