#lang racket

(define (max-k-distinct nums k)
  (let ((sorted-distincts (sort (remove-duplicates nums) >)))
    (if (< (length sorted-distincts) k)
        sorted-distincts
        (take sorted-distincts k))))

(max-k-distinct '(84 93 100 77 90) 3) ; => '(100 93 90)
(max-k-distinct '(84 93 100 77 93) 3) ; => '(100 93 84)
(max-k-distinct '(1 1 1 2 2 2) 6) ; => '(2 1)
