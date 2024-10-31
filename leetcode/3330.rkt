#lang racket

(define (possible-string-count word)
  (let ((chars (string->list word)))
    (+ 1 (foldl
          (lambda (a acc)
            (+ acc (if a 1 0)))
          0
          (map
           equal?
           (take chars (- (length chars) 1))
           (cdr chars))))))
