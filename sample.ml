#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

(* parse_exp (Pair ((Symbol "if"), Pair (Bool false, Pair (String "pass", Pair (Nil, Nil)))));; *)
let bla = read_sexpr "(lambda s )";;

parse_exp (Pair (Symbol "lambda", Pair (Symbol "s", Nil)));;