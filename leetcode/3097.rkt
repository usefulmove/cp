#lang racket

(define (minimum-subarray-length nums k)
  (let ((return -1)
        (len (length nums))
        (sublist (lambda (lst a b)
                   (drop (take lst b) a))))
    (for ((i (range len)))
      (for ((j (range (+ i 1) (+ len 1))))
        (if (or (= return -1)
                (< (- j i) return))
            (let* ((sub (sublist nums i j))
                   (sub-or (apply bitwise-ior sub)))
              (if (>= sub-or k)
                  (set! return (- j i))
                  (void)))
            (void))))
    return))

(println
 (minimum-subarray-length '(1 2 3) 2))
(println
 (minimum-subarray-length '(2 1 8) 10))
(println
 (minimum-subarray-length '(1 2) 0))
