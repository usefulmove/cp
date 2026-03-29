type nucleotide = A | C | G | T

let hamming_distance stranda strandb =
  if List.length stranda = List.length strandb then
    Ok
      (List.fold_left2
         (fun cnt a b -> cnt + Bool.to_int (a <> b))
         0 stranda strandb)
  else Error "strands must be of equal length"
