let validate candidate =
    let digits =
        List.map Char.Ascii.digit_to_int ((string_of_int candidate) |> String.to_seq |> List.of_seq) in
    let n =
        String.length (string_of_int candidate) in
    let armstrong_sum =
        List.fold_left (fun acc a -> acc +. (float_of_int a) ** (float_of_int n)) 0.0 digits in
    candidate = int_of_float armstrong_sum

let _ = print_endline (string_of_bool (validate 8))
let _ = print_endline (string_of_bool (validate 10))
let _ = print_endline (string_of_bool (validate 153))
