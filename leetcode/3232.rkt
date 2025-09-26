#lang racket

(define (can-alice-win nums)
  (not (zero? (foldl
               (lambda (n acc) (+ acc (if (< n 10)
                                          n
                                          (- n))))
               0
               nums))))

#;(define (can-alice-win nums)
  (let loop ((ns nums)
             (single-sum 0)
             (double-sum 0))
    (cond ((empty? ns) (not (= single-sum double-sum)))
          ((< (car ns) 10) (loop (cdr ns)
                                 (+ single-sum (car ns))
                                 double-sum))
          (else (loop (cdr ns)
                      single-sum
                      (+ double-sum (car ns)))))))
