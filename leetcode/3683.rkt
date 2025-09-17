#lang racket

(define (earliest-time tasks)
  (let loop ((ts tasks)
             (min-time 10000))
    (if (empty? ts)
        min-time
        (loop (cdr ts)
              (min min-time (apply + (car ts)))))))

#;(define (earliest-time tasks)
  (apply min (map
              (lambda (pair) (apply + pair))
              tasks)))

(earliest-time '((1 6) (2 3))) ; => 5
(earliest-time '((100 100) (100 100) (100 100))) ; => 200
