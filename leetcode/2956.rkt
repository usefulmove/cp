#lang racket

(define (find-intersection-values nums1 nums2)
  (let ((ones-in-two (count (lambda (one) (member one nums2)) nums1))
        (twos-in-one (count (lambda (two) (member two nums1)) nums2)))
    (list ones-in-two twos-in-one)))

(find-intersection-values '(2 3 2) '(1 2)) ; => '(2 1)
(find-intersection-values '(4 3 2 3 1) '(2 2 5 2 3 6)) ; '(3 4)
