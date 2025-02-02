#lang racket

(define (count-partitions nums)
  (let ((sublist (lambda (lst i j)
                   (drop (take lst j) i)))
        (len (length nums)))
    (foldl
     (lambda (i acc)
       (let* ((sub-left (sublist nums 0 i))
              (sub-right (sublist nums i len))
              (sum-difference (- (apply + sub-left)
                                 (apply + sub-right))))
         (if (even? sum-difference)
             (+ acc 1)
             acc)))
     0
     (range 1 len))))

(count-partitions '(10 10 3 7 6))
(count-partitions '(1 2 2))
(count-partitions '(2 4 6 8))
