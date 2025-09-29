#lang racket

(define (decimal-representation n)
  (let ((digits (let loop ((a n)
                           (out '()))
                  (if (zero? a)
                      out
                      (let* ((rem (remainder a 10))
                             (quot (quotient a 10)))
                        (loop quot
                              (cons rem out)))))))
    (foldl
     (lambda (digit ind acc)
       (if (zero? digit)
           acc
           (cons (* digit (expt 10 ind)) acc)))
     '()
     (reverse digits)
     (range (length digits)))))

(decimal-representation 537)
(decimal-representation 102)
(decimal-representation 6)
