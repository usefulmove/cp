#lang racket

(define (minimum-sum nums)
  (let* ((len (length nums))
         (beyond-possible 151)
         (minimum beyond-possible))
    (for ((i (range (- len 2))))
      (for ((j (range (+ i 1) (- len 1))))
        (for ((k (range (+ j 1) len)))
          (let ((num-i (list-ref nums i))
                (num-j (list-ref nums j))
                (num-k (list-ref nums k)))
            (when (and (< num-i num-j)
                       (< num-k num-j))
              (let ((test (+ num-i num-j num-k)))
                (when (< test minimum)
                  (set! minimum test))))))))
    (if (= beyond-possible minimum)
        -1
        minimum)))

(minimum-sum '(8 6 1 5 3)) ; => 9
(minimum-sum '(5 4 8 7 10 2)) ; => 13
(minimum-sum '(6 5 4 3 4 5)) ; => -1
