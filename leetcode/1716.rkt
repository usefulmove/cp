#lang racket

(define (total-money n)
  (let* ((b 7) (q (quotient n b)) (r (remainder n b)))
    (/ (+ (* 2 q r) (* r r) r (* q b b) (* q q b)) 2)))

(total-money 4) ; => 10
(total-money 10) ; => 37
(total-money 20) ; => 96
