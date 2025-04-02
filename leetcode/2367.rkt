#lang racket

(define (arithmetic-triplets nums diff)
  (let ((len (length nums))
        (cnt 0))
    (for ((i (range (- len 2))))
      (for ((j (range (+ i 1) (- len 1))))
        (for ((k (range (+ j 1) len)))
          (let ((num-i (list-ref nums i))
                (num-j (list-ref nums j))
                (num-k (list-ref nums k)))
            (when (= (- num-j num-i)
                     (- num-k num-j)
                     diff)
              (set! cnt (+ cnt 1)))))))
    cnt))

(arithmetic-triplets '(0 1 4 6 7 10) 3) ; => 2
(arithmetic-triplets '(4 5 6 7 8 9) 2) ; => 2
