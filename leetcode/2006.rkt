#lang racket

(define (count-k-difference nums k)
  (let ((len (length nums))
        (count 0))
    (for ((i (range (- len 1))))
      (for ((j (range (+ i 1) len)))
        (if (= k (abs (- (list-ref nums i)
                         (list-ref nums j))))
            (set! count (+ count 1))
            (void))))
    count))
