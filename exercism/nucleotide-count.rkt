#lang racket

(provide nucleotide-counts)

(define (nucleotide-counts nucleotides)
  (sort
   (foldl
    (lambda (nucleotide acc)
      (if (member nucleotide '(#\A #\C #\G #\T))
          (let ((current-pair (assoc nucleotide acc)))
            (cons (cons nucleotide (add1 (cdr current-pair)))
                  (remove current-pair acc)))
          (error "invalid nucleotide input")))
    '((#\A . 0) (#\C . 0) (#\G . 0) (#\T . 0))
    (string->list nucleotides))
   (lambda (pair1 pair2)
     (char<? (car pair1)
             (car pair2)))))
