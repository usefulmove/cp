#lang racket

(define (find-the-distance-value nums1 nums2 d)
  (count
   (lambda (n) (zero? (count
                       (lambda (m) (<= (- n d) m (+ n d)))
                       nums2)))
   nums1))

(find-the-distance-value '(4 5 8) '(10 9 1 8) 2) ; => 2
(find-the-distance-value '(1 4 2 3) '(-4 -3 6 10 20 30) 3) ; => 2
(find-the-distance-value '(2 1 100 3) '(-5 -2 10 -3 7) 6) ; => 1
