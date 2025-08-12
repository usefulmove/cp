#lang racket

(define (smallest-index nums)
  (letrec ((digit-sum (lambda (n)
                        (cond ((< n 10) n)
                              (else (+ (remainder n 10)
                                       (digit-sum (quotient n 10))))))))
    (let recur ((ns nums) (index 0))
      (cond ((empty? ns) -1)
            ((= (digit-sum (car ns)) index) index)
            (else (recur (cdr ns) (+ index 1)))))))

(smallest-index '(1 3 2)) ; => 2
(smallest-index '(1 10 11)) ; => 1
(smallest-index '(1 2 3)) ; => -1
