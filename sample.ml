#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

(* parse_exp (Pair ((Symbol "if"), Pair (Bool false, Pair (String "pass", Pair (Nil, Nil)))));; *)
(* let bla = read_sexpr "(lambda (a b c) )";; *)

parse_exp (
    Pair(Symbol "set!", Pair(Symbol "n", Pair(Pair(Symbol "+", Pair(Symbol "n", Pair(Number (Int 1), Nil))), Nil)))
    );;