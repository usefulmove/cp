#lang racket

(define (find-even-numbers digits)
  (let ((possibles (range 100 999 2)))
    (filter
     (lambda (num)
       (let loop ((n num)
                  (ds digits))
         (let ((digit (remainder n 10)))
           (cond ((zero? n)) ; keep?
                 ((member digit ds) (loop (quotient n 10)
                                          (remove digit ds)))
                 (else #f)))))
     possibles)))

(find-even-numbers '(2 1 3 0))
(find-even-numbers '(2 2 8 8 2))
(find-even-numbers '(3 7 5))
