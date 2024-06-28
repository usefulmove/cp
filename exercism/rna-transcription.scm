(define (dna->rna dna)
  (list->string 
   (map
    (lambda (dna-nucleotide)
      (case dna-nucleotide
        ((#\G) #\C)
        ((#\C) #\G)
        ((#\T) #\A)
        ((#\A) #\U)))
    (string->list dna))))

(display
 (dna->rna "GCTA"))
(newline)
