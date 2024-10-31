#lang racket

(define (possible-string-count word)
  (let ((chars (string->list word)))
    (+ 1 (foldl
          (lambda (c1 c2 acc)
            (+ acc
               (if (equal? c1 c2) 1 0)))
          0
          (take chars (- (length chars) 1))
          (cdr chars)))))
