#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

tag_parse_expression (
Pair(Symbol "let*", Pair(Pair(Pair(Symbol "a", Pair(Number (Int 2), Nil)), Pair(Pair(Symbol "b", Pair(Pair(Symbol "+", Pair(Number (Int 1), Pair(Symbol "a", Nil))), Nil)), Nil)), Pair(Symbol "b", Nil)))
        );;
