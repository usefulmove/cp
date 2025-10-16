#lang racket

#|
Iterate through the list, keeping track of two accumulators - one for the length of the currently ongoing Fibonacci sequence and one for the longest Fibonacci sequence seen so far. Reset the ongoing accumulator when the sequence is broken.
|#

(define (longest-subarray nums)
  (let loop ((xs nums) (acc-ongoing 0) (acc-longest 0))
    (cond ((empty? xs) acc-longest) ; no elements left
          ((empty? (cdr xs)) (max acc-longest 1)) ; one element left
          ((empty? (cddr xs)) (max acc-longest 2)) ; two elements left
          ((= (+ (first xs)
                 (second xs))
              (third xs)) ; three or more and matches fib pattern
           (let ((updated-acc-ongoing (if (zero? acc-ongoing)
                                          3
                                          (+ acc-ongoing 1))))
             (loop (cdr xs)
                   updated-acc-ongoing
                   (max acc-longest updated-acc-ongoing))))
          (else ; three or more and no match
           (loop (cdr xs) 0 acc-longest))))) ; reset ongoing acc.

(longest-subarray '(1 1 1 1 2 3 5 1)) ; => 5
(longest-subarray '(5 2 7 9 16)) ; => 5
(longest-subarray '(1000000000 1000000000 1000000000)) ; => 2
(longest-subarray '(1 1 2)) ; => 3
