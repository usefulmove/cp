#lang racket

(define (minimum-average nums)
  (letrec ((iter (lambda (sorted-nums acc)
                   (if (null? sorted-nums)
                       acc
                       (let ((n (length sorted-nums))
                             (low (first sorted-nums))
                             (high (last sorted-nums)))
                         (iter
                          (take (drop sorted-nums 1) (- n 2)) ; update nums
                          (cons (* 0.5 (+ low high)) acc))))))) ; update acc
    (apply min
     (iter (sort nums <) '()))))


(minimum-average '(7 8 3 4 15 13 4 1))
(minimum-average '(1 9 8 3 10 5))
(minimum-average '(1 2 3 7 8 9))
