#lang racket

(define (smallest-index nums)
  (letrec ((digit-sum (lambda (n)
                        (if (< n 10)
                            n
                            (+ (remainder n 10)
                               (digit-sum (quotient n 10)))))))
    (let recur ((ns nums)
                (index 0))
      (if (= (digit-sum (car ns)) index)
          index
          (recur (cdr ns)
                 (+ index 1))))))

(smallest-index '(1 3 2)) ; => 2
(smallest-index '(1 10 11)) ; => 1
