#lang racket

(define (maximum-subarray-sum nums k)
  (let ((max-sum 0)
        (all-distinct? (lambda (lst)
                         (= k (set-count (apply set lst)))))
        (sublist (lambda (lst from to)
                   (drop (take lst to) from))))
    (for ((i (range (- (length nums) k -1))))
      (let* ((sub (sublist nums i (+ i k))))
        (if (all-distinct? sub)
            (set! max-sum (max max-sum (apply + sub)))
            (void))))
    max-sum))

(maximum-subarray-sum '(1 5 4 2 9 9 9) 3)
(maximum-subarray-sum '(4 4 4) 3)
