
(* All the characters to choose from. *)
let mandatory_chars = [
  String.init (Char.code 'z' - Char.code 'a' + 1) (fun i -> Char.chr (i + Char.code 'a'));
  String.init (Char.code 'Z' - Char.code 'A' + 1) (fun i -> Char.chr (i + Char.code 'A'));
  String.init (Char.code '9' - Char.code '0' + 1) (fun i -> Char.chr (i + Char.code '0'));
  "!\"#$%&'()*+,-./:;<=>?@[]^_{|}~"
]

(* All the characters to choose from, like above, but in one single string. *)
let all_mandatory_chars = String.concat "" mandatory_chars


(* Visually similar characters. *)
let visually_sim = "Il1O05S2Z"


(* Select a random character from a string. *)
let rec select_rnd_char safe s =
  let i = Random.int (String.length s) in
  let c = s.[i] in
  if safe && String.contains visually_sim c
  then select_rnd_char safe s
  else c


(* Take one of each: lower case letter, upper case letter, digit, special chars. *)
let minimal_selection safe () =
  List.map (select_rnd_char safe) mandatory_chars


(* Select randomly the necessary chars for one password. *)
let select_chars safe lg () =
  let min_sel = minimal_selection safe () in
  let rec loopit n res =
    if n <= 0
    then res
    else loopit (n - 1) (select_rnd_char safe all_mandatory_chars :: res) 
  in
  loopit (lg - List.length min_sel) min_sel


(* Create a list of randomly ordered indexes. *)
let random_idx lg () =
  (* Add one random digit to the list. No repetions allowed. *)
  let rec add_dig ls =
    let rnd_idx = Random.int lg in
    if List.mem rnd_idx ls
    then add_dig ls
    else rnd_idx :: ls
  in
  let rec loopit n lst =
    if n <= 0 
    then lst
    else loopit (n - 1) (add_dig lst)
  in
  loopit lg []


(* Generate one password string of a certain length. *)
let generate_pwd lg safe () =
  let chars = List.combine (random_idx lg ()) (select_chars safe lg ())
              |> List.sort compare
              |> List.map (fun (_, c) -> c) in
  String.init lg (fun i -> List.nth chars i)


(* Generate a certain number of passwords of a certain length. *)
let rec generate n lg safe =
  if n <= 0
  then []
  else generate_pwd lg safe () :: (generate (n - 1) lg safe)

