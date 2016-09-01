
(* Default values for command line options. *)
let def_len = 4
let def_num = 1
let def_seed = min_int
let def_safe = false

(* Values that are actually set from the command line. *)
let len = ref def_len
let num = ref def_num
let seed = ref def_seed
let safe = ref def_safe


let usage = 
  Sys.argv.(0) ^": Generate random passwords.\n" ^
  "usage: " ^ Sys.argv.(0) ^ " [--len <number>] [--num <number>] [--seed <number>] [--safe]"


let speclist = [
  ("--len", Arg.Int (fun n ->
                       if n < def_len
                       then let err_msg = Printf.sprintf "Minimum length for a password is %d" def_len in
                            raise (Arg.Bad err_msg)
                       else len := n),
   Printf.sprintf ": length of the password (default and minimum = %d)" def_len);

  ("--num", Arg.Int (fun n ->
                       if n < def_num
                       then let err_msg = Printf.sprintf "Minimum number of passwords is %d" def_num in
                            raise (Arg.Bad err_msg)
                       else num := n),
   Printf.sprintf ": number of passwords to be generated (default and minimum = %d)" !num);

  ("--seed", Arg.Set_int seed,
   Printf.sprintf ": arbitrary number used as a seed for the random number generator");

  ("--safe", Arg.Set safe,
   Printf.sprintf ": exclude visually similar characters")
]

