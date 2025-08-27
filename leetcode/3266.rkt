#lang racket

(define (check-divisibility n)
  (let ((dsum (let loop ((a n)
                         (sum 0))
                (if (zero? a)
                    sum
                    (loop (quotient a 10)
                          (+ sum (remainder a 10))))))
        (dprod (let loop ((b n)
                          (prod 1))
                 (if (zero? b)
                     prod
                     (loop (quotient b 10)
                           (* prod (remainder  b 10)))))))
    (zero? (remainder n (+ dsum dprod)))))

(check-divisibility 99) ; => #t
(check-divisibility 23) ; => #f
(check-divisibility 8)
