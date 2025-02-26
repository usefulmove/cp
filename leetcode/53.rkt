#lang racket

(define (max-sub-array nums)
  (let ((cnt (length nums))
        (max-so-far -2e32))
    (for ((i (range cnt)))
      (for ((j (range i cnt)))
        (let* ((sub (drop (take nums (+ j 1)) i))
               (sum (apply + sub)))
          (if (> sum max-so-far)
              (set! max-so-far sum)
              (void)))))
    max-so-far))

(max-sub-array '(-2 1 -3 4 -1 2 1 -5 4)) ; => 6
(max-sub-array '(1)) ; => 1
