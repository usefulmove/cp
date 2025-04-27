#lang racket

(define (count-subarrays nums)
  (let loop ((ns nums)
             (cnt 0))
    (if (< (length ns) 3)
        cnt
        (loop (cdr ns)
              (if (= (+ (first ns)
                        (third ns))
                     (/ (second ns) 2))
                  (add1 cnt)
                  cnt)))))

(count-subarrays '(1 2 1 4 1))
(count-subarrays '(1 1 1))
