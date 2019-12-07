#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

(* parse_exp (Pair ((Symbol "if"), Pair (Bool false, Pair (String "pass", Pair (Nil, Nil)))));; *)
(* let bla = read_sexpr "(lambda (a b c) )";; *)

parse_exp (Pair(Symbol "define", Pair(Symbol "a", Pair(Number (Int 5), Nil))));;