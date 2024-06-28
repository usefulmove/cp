#lang racket


(define (time-required-to-buy tickets k (acc 0))
  (let ((tickets-left (list-ref tickets k)))
    (cond ((= 0 tickets-left) acc)
          ((= 1 tickets-left) (+ acc (count
                                      positive?
                                      (take tickets (add1 k)))))
          (else (time-required-to-buy
                 (map
                  (lambda (a) (if (positive? a) (sub1 a) 0))
                  tickets)
                 k
                 (+ acc (count positive? tickets)))))))


(time-required-to-buy '(2 3 2) 2) ; => 6
(time-required-to-buy '(5 1 1 1) 0) ; => 8
(time-required-to-buy '(84 49 5 24 70 77 87 8) 3) ; => 154
