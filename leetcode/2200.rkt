#lang racket

(define (find-k-distant-indicies nums key k)
  (let* ((target-inds (indexes-of nums key))
         (close? (lambda (ind)
                   (ormap
                    (lambda (target)
                      (<= (abs (- target ind)) k))
                    target-inds))))
    (filter close? (range (length nums)))))

(find-k-distant-indicies '(3 4 9 1 3 9 5) 9 1)
(find-k-distant-indicies '(2 2 2 2 2) 2 2)
