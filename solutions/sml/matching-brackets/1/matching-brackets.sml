fun isMember (input: char) (lst: char list): bool =
    case lst of
    [] => false
    | x :: xs =>
        case input = x of
            true => true
            | false => isMember input xs

val opening = [#"(", #"{", #"["]
val closing = [#")", #"}", #"]"]

fun isOpening (chr: char): bool = isMember chr opening

fun isClosing (chr: char): bool = isMember chr closing

fun match (popped: char, toCompare: char): bool =
    let val expected = case popped of
        #"(" => #")"
        | #"[" => #"]"
        | #"{" => #"}"
        |_ => #"#"
    in expected = toCompare
    end

fun isBalanced (input: string): bool =
    let fun helper (lst: char list, stack: char list) =
        case lst of
            [] => (length stack) = 0
            | x::xs
                => case isOpening x of
                    true => helper (xs, x :: stack)
                    | _ => case isClosing x of
                            true => let val toPop = stack
                                    in case toPop of
                                        [] => false
                                        | _::ys => case match (hd toPop, x)  of
                                                    true => helper (xs, ys)
                                                    | _ => false
                                    end
                            | _ => helper (xs, stack)

    in helper (explode input, [])
    end