(import (rnrs))

(define (nucleotide-count dna)
  (fold-left
   (lambda (acc nuc)
     (if (member nuc '(#\A #\C #\G #\T))
         (let ((pair (assoc nuc acc)))
           (cons (cons nuc (add1 (cdr pair)))
                 (remove pair acc)))
         (error 'nucleotide-count "strand with invalid nucleotides")))
   '((#\A . 0) (#\C . 0) (#\G . 0) (#\T . 0))
   (string->list dna)))
