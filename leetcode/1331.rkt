#lang racket

(define (array-rank-transform values)
  (let* ((sorted-values (remove-duplicates (sort values <)))
         (value-rank-hash (make-hash (map
                                      cons
                                      sorted-values
                                      (range 1 (+ 1 (length sorted-values)))))))
    (map
     (lambda (value)
       (hash-ref value-rank-hash value))
     values)))

(array-rank-transform '(100 100 100))
(array-rank-transform '(100 200 300))
(array-rank-transform '(400 100 300 200))
(array-rank-transform '(37 12 28 9 100 56 80 5 12))
