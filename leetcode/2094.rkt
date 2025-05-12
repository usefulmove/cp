#lang racket

(define (find-even-numbers digits)
  (let ((possibles (range 100 999 2)))
    (filter
     (lambda (num)
       (let loop ((n num)
                  (ds digits))
         (if (zero? n)
             #t ; keep
             (let ((digit (remainder n 10))
                   (rest (quotient n 10)))
               (if (member digit ds)
                   (loop rest
                         (remove digit ds))
                   #f)))))
     possibles)))

(find-even-numbers '(2 1 3 0))
(find-even-numbers '(2 2 8 8 2))
(find-even-numbers '(3 7 5))
