#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

tag_parse_expression (
Pair(Symbol "define", Pair(Pair(Symbol "x", Pair(Symbol "a", Pair(Symbol "b", Pair(Symbol "c", Nil)))), Pair(Bool true, Pair(Pair(Symbol "+", Pair(Symbol "b", Pair(Symbol "c", Nil))), Pair(Pair(Symbol "+", Pair(Pair(Symbol "-", Pair(Number (Int 23), Pair(Symbol "a", Nil))), Pair(Symbol "b", Nil))), Pair(Pair(Symbol "let", Pair(Pair(Pair(Symbol "d", Pair(Number (Int 3), Nil)), Nil), Pair(Pair(Symbol "+", Pair(Symbol "d", Pair(Symbol "a", Nil))), Nil))), Nil))))))
);;



 