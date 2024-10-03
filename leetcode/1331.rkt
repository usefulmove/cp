#lang racket

(define (array-rank-transform vals)
  (let* ((sorted-vals (remove-duplicates (sort vals <)))
         (value-rank-assoc (map
                            cons
                            sorted-vals
                            (range 1 (+ 1 (length sorted-vals)))))
         (value-rank-hash (make-hash value-rank-assoc)))
    (map
     (lambda (value)
       #;(cdr (assoc value value-rank-assoc))
       (hash-ref value-rank-hash value))
     vals)))

(array-rank-transform '(100 100 100))
(array-rank-transform '(100 200 300))
(array-rank-transform '(400 100 300 200))
(array-rank-transform '(37 12 28 9 100 56 80 5 12))
