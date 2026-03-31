let validate candidate =
  let candidate_string = string_of_int candidate in
  let digits =
    List.map Char.Ascii.digit_to_int
      (candidate_string |> String.to_seq |> List.of_seq)
  in
  let n = String.length candidate_string in
  let rec power_int base exp =
    match exp with 1 -> base | _ -> base * power_int base (exp - 1)
  in
  let armstrong_sum =
    List.fold_left (fun acc a -> acc + power_int a n) 0 digits
  in
  candidate = armstrong_sum

let _ = print_endline (string_of_bool (validate 8)) (* true *)
let _ = print_endline (string_of_bool (validate 10)) (* false *)
let _ = print_endline (string_of_bool (validate 153)) (* true *)
