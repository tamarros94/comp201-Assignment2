#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

(* parse_exp (Pair ((Symbol "if"), Pair (Bool false, Pair (String "pass", Pair (Nil, Nil)))));; *)
(* let bla = read_sexpr "(lambda (a b c) )";; *)

parse_exp (
Pair (Symbol "cond", Pair (Pair (Symbol "x", Pair (Pair (Symbol "begin", Pair (Symbol "x", Nil)), Nil)), Pair (Pair (Pair (Symbol "lambda", Pair (Pair (Symbol "x", Nil), Pair (Symbol "x", Nil))), Pair (Symbol "=>", Pair (Pair (Symbol "cond", Pair (Pair (Symbol "else", Pair (Pair (Symbol "lambda", Pair (Pair (Symbol "x", Nil), Pair (Pair (Symbol "x", Nil), Nil))), Nil)), Nil)), Nil))), Pair (Pair (Symbol "else", Pair (Symbol "value", Nil)), Nil))))
);;

(* convert_pairs_to_list  *)
