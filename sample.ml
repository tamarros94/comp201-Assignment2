#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

tag_parse_expression (
(Pair (Symbol "quasiquote",
       Pair
        (Pair (Number (Int 1),
          Pair (Number (Int 2), Pair (Number (Int 3), Nil))),
        Nil)))
        );;
