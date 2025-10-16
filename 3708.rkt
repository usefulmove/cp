#lang racket

(define (longest-subarray nums)
  (let loop ((xs nums) (continuation 0) (longest 0))
    (cond ((empty? xs) longest)
          ((empty? (cdr xs)) (max longest 1))
          ((empty? (cddr xs)) (max longest 2))
          ((= (+ (first xs)
                 (second xs))
              (third xs))
           (let ((updated-continuation (if (zero? continuation)
                                           3
                                           (+ continuation 1))))
             (loop (cdr xs)
                   updated-continuation
                   (max longest updated-continuation))))
          (else
           (loop (cdr xs) 0 longest)))))

(longest-subarray '(1 1 1 1 2 3 5 1)) ; => 5
(longest-subarray '(5 2 7 9 16)) ; => 5
(longest-subarray '(1000000000 1000000000 1000000000)) ; => 2
(longest-subarray '(1 1 2)) ; => 3
