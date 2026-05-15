#lang racket

(define (find-min nums)
  (let loop ((xs nums)
             (seed (first nums)))
    (cond ((< (length xs) 2) seed)
          ((< (second xs) (first xs)) (second xs))
          (else (loop (rest xs) seed)))))

(find-min '(3 4 5 1 2))
(find-min '(4 5 6 7 0 1 2))
(find-min '(11 13 15 17))
