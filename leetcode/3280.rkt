#lang racket

(define (convert-date-to-binary date)
  (string-join
   (map
    (lambda (s)
      (number->string (string->number s) 2))
    (string-split date "-"))
   "-"))

(convert-date-to-binary "2080-02-29")
(convert-date-to-binary "1900-01-01")
