#lang racket

(define (xor-all-nums nums1 nums2)
  (foldl
   (lambda (num-a acc)
     (bitwise-xor acc (foldl
                       (lambda (num-b sub-acc)
                         (bitwise-xor sub-acc num-a num-b))
                       0
                       nums2)))
   0
   nums1))

(xor-all-nums '(2 1 3) '(10 2 5 0)) ; => 13
(xor-all-nums '(1 2) '(3 4)) ; => 0
