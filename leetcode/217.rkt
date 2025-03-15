#lang racket

(define (contains-duplicates nums)
  (not (= (length nums)
          (length (remove-duplicates nums)))))

(contains-duplicates '(1 2 3 1))
(contains-duplicates '(1 2 3 4))
(contains-duplicates '(1 1 1 3 3 4 3 2 4 2))
