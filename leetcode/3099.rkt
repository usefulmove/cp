#lang racket

(define (sum-of-the-digits-of-harshad-number x)
  (let* ((digits (map
                  (lambda (c)
                    (- (char->integer c)
                       (char->integer #\0)))
                  (string->list (number->string x))))
         (sum-of-digits (apply + digits)))
    (if (zero? (modulo x sum-of-digits))
        sum-of-digits
        -1)))

(sum-of-the-digits-of-harshad-number 18)
(sum-of-the-digits-of-harshad-number 23)
