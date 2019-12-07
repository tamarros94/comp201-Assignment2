#use "reader.ml";;
open Reader;;

type constant = 
(*
quoted and unquoted: Pair(Symbol(name), Pair(sexpr, Nil())
booleans
chars
numbers
strings
tag def -> field is always a const. if the field is quote, it should not appear in the Const we generate.
tag ref
*)
  | Sexpr of sexpr
  | Void

type expr =
  | Const of constant
  | Var of string
  | If of expr * expr * expr
  | Seq of expr list
  | Set of expr * expr
  | Def of expr * expr
  | Or of expr list
  | LambdaSimple of string list * expr
  | LambdaOpt of string list * string * expr
  | Applic of expr * (expr list);;

let rec expr_eq e1 e2 =
  match e1, e2 with
  | Const Void, Const Void -> true
  | Const(Sexpr s1), Const(Sexpr s2) -> sexpr_eq s1 s2
  | Var(v1), Var(v2) -> String.equal v1 v2
  | If(t1, th1, el1), If(t2, th2, el2) -> (expr_eq t1 t2) &&
                                            (expr_eq th1 th2) &&
                                              (expr_eq el1 el2)
  | (Seq(l1), Seq(l2)
    | Or(l1), Or(l2)) -> List.for_all2 expr_eq l1 l2
  | (Set(var1, val1), Set(var2, val2)
    | Def(var1, val1), Def(var2, val2)) -> (expr_eq var1 var2) &&
                                             (expr_eq val1 val2)
  | LambdaSimple(vars1, body1), LambdaSimple(vars2, body2) ->
     (List.for_all2 String.equal vars1 vars2) &&
       (expr_eq body1 body2)
  | LambdaOpt(vars1, var1, body1), LambdaOpt(vars2, var2, body2) ->
     (String.equal var1 var2) &&
       (List.for_all2 String.equal vars1 vars2) &&
         (expr_eq body1 body2)
  | Applic(e1, args1), Applic(e2, args2) ->
     (expr_eq e1 e2) &&
       (List.for_all2 expr_eq args1 args2)
  | _ -> false;;
	
                       
exception X_syntax_error;;

(* module type TAG_PARSER =  *)
(* sig
  val tag_parse_expression : sexpr -> expr
  val tag_parse_expressions : sexpr list -> expr list
end;;  *)
(* signature TAG_PARSER *)

module Tag_Parser 
(* : TAG_PARSER  *)
= struct

let reserved_word_list =
  ["and"; "begin"; "cond"; "define"; "else";
   "if"; "lambda"; "let"; "let*"; "letrec"; "or";
   "quasiquote"; "quote"; "set!"; "unquote";
   "unquote-splicing"];;  

(* work on the tag parser starts here *)

let rec convert_pairs_to_list sexpr = match sexpr with
| Pair(car, cdr) -> List.append (convert_pairs_to_list car) (convert_pairs_to_list cdr)
| Nil -> []
| other -> [other]

let rec convert_pairs_to_str_list sexpr = 
(* match sexpr with *)
  (* | Pair(car, cdr) -> List.append (convert_pairs_to_str_list car) (convert_pairs_to_str_list cdr)
  | Nil -> []
  | Symbol(str) -> [str]
  | _ -> [] *)
  let flat_list = convert_pairs_to_list sexpr in
  List.map (fun e -> match e with
  |Symbol(str)->str
  |_ -> raise X_syntax_error)
   flat_list;;

let rec is_proper_list sexpr = match sexpr with
    | Pair(car, cdr) -> is_proper_list cdr
    | Nil -> true
    | _ -> false

let get_last_element lst = 
    let rev_lst = List.rev lst in match rev_lst with
    | car :: cdr -> car
    | [] -> "empty list";;

let rec remove_last_element lst = match lst with
    | [x] -> []
    | car :: cdr -> List.append [car] (remove_last_element cdr)
    | [] -> [];;

let rec parse_exp sexpr = match sexpr with
(*constants*)
  | Bool(e) -> Const(Sexpr(Bool(e)))
  | Char(e) -> Const(Sexpr(Char(e)))
  | Number(e) -> Const(Sexpr(Number(e)))
  | String(e) -> Const(Sexpr(String(e)))
  | Pair(Symbol("quote"), Pair(e, Nil)) -> Const(Sexpr(e))
  | TagRef(e) -> Const(Sexpr(TagRef(e)))
  | TaggedSexpr(e,Pair(Symbol "quote", Pair(x, Nil))) -> Const(Sexpr(TaggedSexpr(e, Nil)))
  | TaggedSexpr(e,Bool(x)) -> Const(Sexpr(TaggedSexpr(e, Bool(x))))
  | TaggedSexpr(e,Char(x)) -> Const(Sexpr(TaggedSexpr(e, Char(x))))
  | TaggedSexpr(e,Number(x)) -> Const(Sexpr(TaggedSexpr(e, Number(x))))
  | TaggedSexpr(e,String(x)) -> Const(Sexpr(TaggedSexpr(e, String(x))))
  | TaggedSexpr(e,TagRef(x)) -> Const(Sexpr(TaggedSexpr(e, TagRef(x))))
(*variables*)
  | Symbol(e) -> (
      let is_reserved_word = List.mem e reserved_word_list in
          if is_reserved_word then raise X_syntax_error else Var(e))
(*conditionals*)
  | Pair(Symbol("if"), Pair(test, Pair(dit, Pair(Nil, Nil)))) ->
        If(parse_exp test, parse_exp dit, Const(Void))
  | Pair(Symbol("if"), Pair(test, Pair(dit, Pair(dif, Nil)))) ->
        If(parse_exp test, parse_exp dit, parse_exp dif)

(*lambdas*)
  | Pair(Symbol("lambda"), Pair(args, body)) -> (
      match args with
      | Pair(car, cdr) -> let str_list = convert_pairs_to_str_list args in 
        if (is_proper_list args) then LambdaSimple(str_list, Const(Void)(*parse_exp body*)) else 
        let lst_without_last_element = remove_last_element str_list in 
        let last_element = get_last_element str_list in 
        LambdaOpt(lst_without_last_element, last_element, Const(Void)(*parse_exp body*))
      | Symbol(str) -> LambdaOpt([], str, Const(Void)(*parse_exp body*))
      | _ -> raise X_syntax_error
  )
  | Pair(Symbol "or", bool_pairs) -> let bool_list = List.map parse_exp (convert_pairs_to_list bool_pairs) in
    Or(bool_list)
  | Pair(Symbol "define", Pair(name, Pair(sexpr, Nil))) -> Def((parse_exp name), (parse_exp sexpr))


  (*applic*)
  | Pair(proc_sexpr, sexprs) -> let proc_expr = parse_exp proc_sexpr in
  let exprs = List.map parse_exp (convert_pairs_to_list sexprs) in
  Applic(proc_expr, exprs)
  | _ -> raise X_syntax_error;;


let tag_parse_expression sexpr = raise X_not_yet_implemented;;

let tag_parse_expressions sexpr = raise X_not_yet_implemented;;

  
end;; (* struct Tag_Parser *)
