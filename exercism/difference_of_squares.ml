let square_of_sum n =
  let sum = List.fold_left (fun a b -> a + b) 0 (List.init (n + 1) Fun.id) in
  sum * sum

let sum_of_squares n =
  List.fold_left (fun acc a -> acc + (a * a)) 0 (List.init (n + 1) Fun.id)

let difference_of_squares n = square_of_sum n - sum_of_squares n
