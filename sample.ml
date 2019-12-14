#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;



tag_parse_expression (
Pair(Symbol "cond", Pair(Pair(Symbol "x", Pair(Pair(Symbol "begin", Pair(Symbol "x", Nil)), Nil)), Pair(Pair(Pair(Symbol "lambda", Pair(Pair(Symbol "x", Nil), Pair(Symbol "x", Nil))), Pair(Symbol "=>", Pair(Pair(Symbol "cond", Pair(Pair(Symbol "else", Pair(Pair(Symbol "lambda", Pair(Pair(Symbol "x", Nil), Pair(Pair(Symbol "x", Nil), Nil))), Nil)), Nil)), Nil))), Pair(Pair(Symbol "else", Pair(Symbol "value", Nil)), Nil))))
);;
