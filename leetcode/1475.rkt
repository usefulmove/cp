#lang racket

(define (final-prices prices)
  (let loop ((ps prices)
             (output '()))
    (if (empty? ps)
        (reverse output)
        (let* ((default-price (car ps))
               (discounts (cdr ps))
               (discount (let loop ((ds discounts))
                           (cond ((empty? ds) 0)
                                 ((<= (car ds) default-price) (car ds))
                                 (else (loop (cdr ds)))))))
          (loop (cdr ps)
                (cons (- default-price discount)
                      output))))))

(final-prices '(8 4 6 2 3)) ; => (4 2 4 2 3)
(final-prices '(1 2 3 4 5)) ; => (1 2 3 4 5)
(final-prices '(10 1 1 6)) ; => (9 0 1 6)

;(8 . (4 6 2 3)) => 4
;(4 . (6 2 3)) => 2
;(6 . (2 3)) => 4
;(2 . (3)) => 2
;(3 . ()) => 3

;(10 . (1 1 6)) => 9
;(1 . (1 6)) => 0
;(1 . (6)) => 1
;(6. ()) => 6
