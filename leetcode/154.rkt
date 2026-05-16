#lang racket

(define (find-min nums)
  (let loop ((xs nums)
             (seed (first nums)))
    (cond ((< (length xs) 2) seed)
          ((< (second xs) (first xs)) (second xs))
          (else (loop (rest xs) seed)))))
