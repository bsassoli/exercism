module Sublist exposing (ListComparison(..), sublist)


type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal


sublist : List a -> List a -> ListComparison
sublist alist blist =
    if alist == blist then
        Equal

    else if isContainedIn blist alist then
        Sublist

    else if isContainedIn alist blist then
        Superlist

    else
        Unequal


isContainedIn : List a -> List a -> Bool
isContainedIn haystack needle =
    let
        needleLen =
            List.length needle

        check h =
            if List.take needleLen h == needle then
                True

            else
                case h of
                    [] ->
                        False

                    _ :: rest ->
                        check rest
    in
    check haystack
