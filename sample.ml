#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;



tag_parse_expression (
Pair (Symbol "lambda",
 Pair (Pair (Symbol "x", Pair (Symbol "y", Nil)),
  Pair (Pair (Symbol "+", Pair (Number (Int 1), Pair (Number (Int 2), Nil))),
   Nil)))
);;

(* read_sexpr "(lambda (x x) (+ 1 2))" *)

