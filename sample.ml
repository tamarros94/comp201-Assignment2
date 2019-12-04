#use "tag-parser.ml";;
#use "reader.ml";;
open Reader;;
open Tag_Parser;;

parse_constant (TaggedSexpr ("x", Number (Int 2)));;