#lang racket

(provide classify)

(define (classify n)
  (if (<= n 0)
      (error 'classify "invalid input")
      (let ((aliquot-sum (foldl
                          (lambda (a acc)
                            (+ acc (if (zero? (modulo n a)) a 0)))
                          0
                          (range 1 (add1 (quotient n 2))))))
        (cond ((= n aliquot-sum) 'perfect)
              ((< n aliquot-sum) 'abundant)
              ((> n aliquot-sum) 'deficient)))))
