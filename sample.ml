#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

(* parse_exp (Pair ((Symbol "if"), Pair (Bool false, Pair (String "pass", Pair (Nil, Nil)))));; *)
(* let bla = read_sexpr "(lambda (a b c) )";; *)

parse_exp (
Pair(Symbol "lambda", Pair(Pair(Symbol "a", Pair(Symbol "b", Nil)), Pair(Pair(Symbol "+", Pair(Symbol "a", Pair(Symbol "b", Nil))), Pair(Number (Int 6), Nil)))) 
 );;

 (* convert_pairs_to_list (Pair(Symbol "lambda", Pair(Pair(Symbol "a", Pair(Symbol "b", Nil)), Pair(Pair(Symbol "+", Pair(Symbol "a", Pair(Symbol "b", Nil))), Pair(Number (Int 6), Nil)))));;  *)
