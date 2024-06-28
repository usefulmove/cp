#lang racket


(define (longest-monotonic-subarray nums)
  (let ((len (length nums))
        (slice (lambda (lst a b)
                 (drop (take lst b) a)))
        (longest 0))
    (for ((i (range (add1 len))))
      (for ((j (range (add1 i) (add1 len))))
        (let ((sublst (slice nums i j)))
          (if (and (> (- j i) longest)
                   (or (apply < sublst)
                       (apply > sublst)))
              (set! longest (- j i))
              (void)))))
    longest))


(longest-monotonic-subarray '(1 4 3 3 2))
(longest-monotonic-subarray '(3 3 3 3))
(longest-monotonic-subarray '(3 2 1))
