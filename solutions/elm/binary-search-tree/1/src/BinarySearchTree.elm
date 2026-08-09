module BinarySearchTree exposing (BinaryTree(..), makeTree, sort)


type BinaryTree
    = Empty
    | Tree BinaryTree Int BinaryTree


addNode : Int -> BinaryTree -> BinaryTree
addNode n t = 
    case t of
        Empty ->
            Tree Empty n Empty
        Tree left root right ->
            if n <= root
            then Tree (addNode n left) root right
            else Tree left root (addNode n right)

makeTree : List Int -> BinaryTree
makeTree data =
    List.foldl addNode Empty data
    

helper : BinaryTree -> List Int
helper t = 
        case t of
            Empty ->
                 []
            Tree left n right -> 
                helper left ++ [n] ++ helper right

sort : List Int -> List Int
sort data = helper (makeTree data)
                    

            
