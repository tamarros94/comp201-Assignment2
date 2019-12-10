#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

(* parse_exp (Pair ((Symbol "if"), Pair (Bool false, Pair (String "pass", Pair (Nil, Nil)))));; *)
(* let bla = read_sexpr "(lambda (a b c) )";; *)

parse_exp (
Pair(Symbol "cond", Pair(Pair(Symbol "else", Pair(Pair(Nil, Pair(Nil, Nil)), Nil)), Nil)));;




