#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

(* parse_exp (Pair ((Symbol "if"), Pair (Bool false, Pair (String "pass", Pair (Nil, Nil)))));; *)
(* let bla = read_sexpr "(lambda (a b c) )";; *)

parse_exp (
Pair(Symbol "and", Pair(Bool true, Pair(Bool true, Pair(Bool true, Pair(Bool false, Nil))))) 
);;

(* convert_pairs_to_list  *)
