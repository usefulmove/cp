#lang racket

(define (remove-trailing-zeros num)
  (cond ((equal? #\0 num) num)
        ((equal? #\0 (last (string->list num)))
         (remove-trailing-zeros (substring num 0 (- (string-length num) 1))))
        (else num)))

(remove-trailing-zeros "51230100")
(remove-trailing-zeros "123")
