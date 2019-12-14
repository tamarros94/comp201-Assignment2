#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

tag_parse_expression (
Pair(Symbol "letrec", Pair(Pair(Pair(Symbol "fact", Pair(Pair(Symbol "lambda", Pair(Pair(Symbol "n", Nil), Pair(Pair(Symbol "if", Pair(Pair(Symbol "zero?", Pair(Symbol "n", Nil)), Pair(Number (Int 1), Pair(Pair(Symbol "*", Pair(Symbol "n", Pair(Pair(Symbol "fact", Pair(Pair(Symbol "-", Pair(Symbol "n", Pair(Number (Int 1), Nil))), Nil)), Nil))), Nil)))), Nil))), Nil)), Nil), Nil))
);;



 