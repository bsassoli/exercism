
fun isVowel c =
    let val vowels = ["a", "e", "i", "o", "u"]
    in List.exists (fn v => v = String.str(Char.toLower c)) vowels
    end

fun startsWithVowelSound word =
    isVowel(String.sub(word, 0)) orelse
    String.isPrefix "xr" word orelse
    String.isPrefix "yt" word

fun splitConsonantCluster word =
    let
        fun split "" = ("", "")
          | split s =
            if isVowel(String.sub(s, 0)) then ("", s)
            else if String.isPrefix "qu" s then (String.extract(s, 0, SOME 2), String.extract(s, 2, NONE))
            else 
                let val (cluster, rest) = split(String.extract(s, 1, NONE))
                in 
                    if rest = "" andalso String.sub(s, 0) = #"y" then
                        ("", String.str(String.sub(s, 0)) ^ cluster)
                    else
                        (String.str(String.sub(s, 0)) ^ cluster, rest)
                end
    in
        split word
    end

fun translateWord word =
    if size word = 2 andalso String.sub(word, 1) = #"y" then
        String.str(String.sub(word, 1)) ^ String.str(String.sub(word, 0)) ^ "ay"
    else if startsWithVowelSound word then
        word ^ "ay"
    else
        let
            val (consonantCluster, rest) = splitConsonantCluster word
        in
            rest ^ consonantCluster ^ "ay"
        end

fun translate sentence =
    let
        val words = String.tokens Char.isSpace sentence
        val translatedWords = List.map translateWord words
    in
        String.concatWith " " translatedWords
    end
