#lang racket

(define/contract (difference-of-sums n m)
  (-> exact-integer? exact-integer? exact-integer?)
  (let* ((sums-pair (foldl
                     (lambda (a acc)
                       (if (zero? (modulo a m)) ; divisible by m?
                           (cons (car acc)
                                 (+ (cdr acc) a)) ; update divisible sum
                           (cons (+ (car acc) a) ; update indivisible sum
                                 (cdr acc))))
                     '(0 . 0) ; (indivisible sum . divisible sum)
                     (range 1 (add1 n)))))
    (- (car sums-pair) (cdr sums-pair))))
