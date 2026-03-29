open Base

type nucleotide = A | C | G | T

val hamming_distance :
  nucleotide list -> nucleotide list -> (int, string) Result.t
(** Compute the hamming distance between the two lists. *)
