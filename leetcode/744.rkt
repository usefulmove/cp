#lang racket

(define (next-greatest-letter letters target)
  (let loop ((ls letters))
    (cond ((empty? ls) (first letters))
          ((char>? (first ls) target) (first ls))
          (else (loop (rest ls))))))
