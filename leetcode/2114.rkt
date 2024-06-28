#lang racket

(define (most-words-found sentences)
  (foldl
   (lambda (sentence acc)
     (let ((len (length (string-split sentence))))
       (if (> len acc) len acc)))
   0
   sentences))

(most-words-found '("alice and bob love leetcode" "i think so too" "this is great thanks very much"))
