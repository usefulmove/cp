#lang racket

(define (divide-array nums)
  (let ((counts (hash-values
                 (foldl
                  (lambda (num count-hash)
                    (if (hash-has-key? count-hash num)
                        (hash-set count-hash num (add1 (hash-ref count-hash num)))
                        (hash-set count-hash num 1)))
                  (hash)
                  nums))))
    (empty? (filter odd? counts))))

(divide-array '(3 2 3 2 2 2)) ; => #t
(divide-array '(1 2 3 4)) ; => #f
