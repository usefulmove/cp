#lang racket

(define (two-fer . maybe-name)
  (format
   "One for ~a, one for me."
   (if (null? maybe-name) "you" (car maybe-name))))
