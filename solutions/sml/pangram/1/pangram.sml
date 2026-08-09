fun isPangram s =
  let 
    val alphabet = explode "abcdefghijklmnopqrstuvwxyz" 
    in 
        List.all (Char.contains (String.map Char.toLower s)) alphabet
    end
