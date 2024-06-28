#lang racket

(define (to-rna dna)
  (foldl
    (lambda (nucleotide acc)
      (string-append acc
                     (case nucleotide
                           ((#\G) "C")
                           ((#\C) "G")
                           ((#\T) "A")
                           ((#\A) "U"))))
    ""
    (string->list dna)))

(displayln
 (to-rna "GCTA"))
