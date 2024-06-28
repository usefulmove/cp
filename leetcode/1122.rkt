#lang racket

(define (relative-sort-array arr1 arr2)
  (let ((sort-fn (lambda (a b)
                   (let ((get-pos (lambda (a)
                                    (let ((pos (index-of arr2 a)))
                                      (if pos pos (+ a 1001))))))
                     (< (get-pos a)
                        (get-pos b))))))
    (sort arr1 sort-fn)))

(relative-sort-array '(2 3 1 3 2 4 6 7 9 2 19) '(2 1 4 3 9 6))
(relative-sort-array '(28 6 22 8 44 17) '(22 28 8 6))
