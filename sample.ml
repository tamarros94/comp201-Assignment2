#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;



parse_exp (
Pair(Symbol "letrec", Pair(Pair(Pair(Symbol "a", Pair(Number (Int 1), Nil)), Pair(Pair(Symbol "b", Pair(Number (Int 2), Nil)), Nil)), Pair(Symbol "body", Nil)))
);;

(* convert_pairs_to_list  *)
