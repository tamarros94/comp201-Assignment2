#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;



parse_exp (
Pair(Symbol "define", Pair(Pair(Symbol "a", Symbol "x"), Pair(Symbol "x", Nil)))
);;
(* convert_pairs_to_list  *)
