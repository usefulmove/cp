#lang racket

(define (three-consecutive-odds arr)
  (let loop ((ns arr)
             (odd-count 0))
    (cond ((empty? ns) #f)
          ((even? (car ns)) (loop (cdr ns) 0))
          ((= 2 odd-count) #t)
          (else (loop (cdr ns) (add1 odd-count))))))

(three-consecutive-odds '(2 6 4 1)) ; => #f
(three-consecutive-odds '(1 2 34 3 4 5 7 23 12)) ; #t
