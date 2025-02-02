#lang racket

(define (subarray-sum nums)
  (let ((sublist (lambda (lst i j)
                   (drop (take lst j) i))))
    (foldl
     (lambda (i acc)
       (let* ((start (max 0 (- i (list-ref nums i))))
              (sub (sublist nums start (+ i 1))))
         (+ acc (apply + sub))))
     0
     (range (length nums)))))

(subarray-sum '(2 3 1))
(subarray-sum '(3 1 1 2))
