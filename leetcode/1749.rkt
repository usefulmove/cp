#lang racket

(define (max-absolute-sum nums)
  (let ((cnt (length nums))
        (max-abs-so-far -2e32))
    (for ((i (range cnt)))
      (for ((j (range i cnt)))
        (let* ((sub (drop (take nums (+ j 1)) i))
               (sum (apply + sub)))
          (if (> (abs sum) max-abs-so-far)
              (set! max-abs-so-far (abs sum))
              (void)))))
    max-abs-so-far))

(max-absolute-sum '(1 -3 2 3 -4)) ; => 5
(max-absolute-sum '(2 -5 1 -4 3 -2)) ; => 8
(max-absolute-sum '(-1)) ; => 1
