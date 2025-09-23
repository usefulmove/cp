#lang racket

(define/contract (smallest-absent nums)
  (-> (listof exact-integer?) exact-integer?)
  (let ((avg (/ (apply + nums)
                (length nums))))
    (let loop ((a (if (integer? avg) (+ avg 1) (ceiling avg))))
      (if (or (member a nums)
              (< a 1))
          (loop (+ a 1))
          a))))
