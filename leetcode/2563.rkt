#lang racket

(define (count-fair-pairs nums lower upper)
  (let ((len (length nums))
        (count 0))
    (for ((i (range (- len 1))))
      (for ((j (range (+ i 1) len)))
        (let ((sum (+ (list-ref nums i)
                      (list-ref nums j))))
          (if (and (>= sum lower)
                   (<= sum upper))
              (set! count (+ count 1))
              (void)))))
    count))

(count-fair-pairs '(0 1 7 4 4 5) 3 6)
(count-fair-pairs '(1 7 9 2 5) 11 11)
