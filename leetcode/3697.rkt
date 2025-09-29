#lang racket

#|
Iterate through each digit `(remainder x 10)`, keeping track of the digit index, and calculate the base-10 contribution if the digit is non-zero.
|#

(define (decimal-representation n)
  (let loop ((res n)
             (ind 0) ; digit position index
             (out '())) ; base-10 components
    (if (zero? res)
        out ; return output
        (let* ((digit (remainder res 10))
               (residual (quotient res 10)))
          (if (zero? digit)
              (loop residual (+ ind 1) out) ; ignore digit
              (loop residual
                    (+ ind 1)
                    (cons (* digit (expt 10 ind)) out)))))))

#;(define (decimal-representation n)
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
