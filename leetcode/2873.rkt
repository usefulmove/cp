#lang racket

(define (maximum-triplet-value nums)
  (let ((len (length nums))
        (maximum 0))
    (for ((i (range (- len 2))))
      (for ((j (range (+ i 1) (- len 1))))
        (for ((k (range (+ j 1) len)))
          (let ((num-i (list-ref nums i))
                (num-j (list-ref nums j))
                (num-k (list-ref nums k)))
            (when (> num-i num-j)
              (let ((test (* (- num-i num-j) num-k)))
                (when (> test maximum)
                  (set! maximum test))))))))
    maximum))

(maximum-triplet-value '(12 6 1 2 7)) ; => 77
