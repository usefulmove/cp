#lang racket

(define (pangram? sentence)
  (= 26 (length 
         (remove-duplicates 
          (map
           char-downcase
           (filter char-alphabetic? (string->list sentence)))))))

(pangram? "The quick brown fox jumps over the lazy dog.")
