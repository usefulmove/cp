#lang racket

(define (detect-capital-use word)
  (or (equal? word (string-downcase word))
      (equal? word (string-upcase word))
      (equal? word (string-titlecase word))))
