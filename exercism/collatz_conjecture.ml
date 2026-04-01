let collatz_conjecture n =
  let rec helper num cnt =
    match num <= 0 with
    | true -> Error "Only positive integers are allowed"
    | false -> (
        match num with
        | 1 -> Ok cnt
        | a -> (
            match a mod 2 with
            | 0 -> helper (a / 2) (cnt + 1)
            | 1 -> helper (3 * a + 1) (cnt + 1)))
  in
  helper n 0
