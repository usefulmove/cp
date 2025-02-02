#lang racket

(define (max-adjacent-distance nums)
  (let ((rotated-nums (cons (last nums)
                            (take nums (- (length nums) 1)))))
    (foldl
     (lambda (a b max-so-far)
       (max max-so-far (abs (- a b))))
     0
     nums
     rotated-nums)))

(max-adjacent-distance '(1 2 4))
(max-adjacent-distance '(-5 -10 -5))
