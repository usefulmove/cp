let collatz_conjecture n =
  let rec helper num cnt =
    if num <= 0 then Error "Only positive integers are allowed"
    else
      match num with
      | 1 -> Ok cnt
      | a ->
          if a mod 2 = 0 then helper (a / 2) (cnt + 1)
          else helper ((3 * a) + 1) (cnt + 1)
  in
  helper n 0
