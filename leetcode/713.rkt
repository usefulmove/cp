#lang racket

(define (num-subarray-product-less-than-k nums k)
  (let ((slice (lambda (lst a b)
                 (drop
                   (take lst (add1 b))
                   a)))
        (product (lambda (lst) (apply * lst)))
        (count 0))
    (for ((i (range (length nums))))
      (for ((j (range i (length nums))))
        (let ((sublst (slice nums i j)))
          (if (< (product sublst) k)
              (set! count (add1 count))
              (void)))))
    count))

(num-subarray-product-less-than-k '(10 5 2 6) 100) ; 8
(num-subarray-product-less-than-k '(1 2 3) 0) ; 0
