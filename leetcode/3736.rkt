#lang racket

(define (min-moves nums)
  (let ((max-nums (apply max nums)))
    (foldl
     (lambda (n moves)
       (+ moves (- max-nums n)))
     0
     nums)))

(min-moves '(2 1 3)) ; => 3
(min-moves '(4 4 5)) ; => 2
