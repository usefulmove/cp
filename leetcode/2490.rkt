#lang racket

(define (is-circular-sentence sentence)
  (let* ((words (string-split sentence))
         (words (cons (last words) words)))
    (foldl
     (lambda (this-word next-word acc)
       (let ((this-chars (string->list this-word))
             (next-chars (string->list next-word)))
         (and acc
              (equal? (last this-chars)
                      (car next-chars)))))
     #t
     (take words (- (length words) 1))
     (cdr words))))
