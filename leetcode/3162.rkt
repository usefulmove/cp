#lang racket

(define (number-of-pairs nums1 nums2 k)
  (let loop ((ns nums1)
             (cnt 0))
    (if (empty? ns)
        cnt
        (loop (cdr ns)
              (+ cnt (count
                      (lambda (n2)
                        (zero? (remainder (car ns) (* n2 k))))
                      nums2))))))

(number-of-pairs '(1 3 4) '(1 3 4) 1)
(number-of-pairs '(1 2 4 12) '(2 4) 3)
