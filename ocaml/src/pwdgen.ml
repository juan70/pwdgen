
(* Main part of the program. *)
let () =
  Arg.parse CliOptions.speclist
            (fun x -> raise (Arg.Bad ("Unknown option: " ^ x)))
            CliOptions.usage;

  if !CliOptions.seed = min_int
  then Random.self_init ()
  else Random.init !CliOptions.seed;

  List.iter print_endline (Pwd.generate !CliOptions.num !CliOptions.len !CliOptions.safe)

