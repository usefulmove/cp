#lang racket

(define (is-circular-sentence sentence)
  (let* ((words (string-split sentence))
         (words-plus (cons (last words) words)))
    (foldl
     (lambda (curr-word next-word acc)
       (let ((curr-chars (string->list curr-word))
             (next-chars (string->list next-word)))
         (and acc
              (equal? (last curr-chars)
                      (car next-chars)))))
     #t
     (take words-plus (- (length words-plus) 1))
     (cdr words-plus))))
