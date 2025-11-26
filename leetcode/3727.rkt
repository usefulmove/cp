#lang racket

(define (max-alternating-sum nums)
  (let ((snums (sort nums (lambda (a b) (> (abs a) (abs b)))))
        (hlen (quotient (+ (length nums) 1) 2))) ; half length
    (let loop ((sns snums)
               (ind 0)
               (acc 0))
      (cond ((empty? sns) acc)
            ((< ind hlen) (loop (cdr sns)
                                (+ ind 1)
                                (+ acc (* (car sns) (car sns)))))
            (else (loop (cdr sns)
                        (+ ind 1)
                        (- acc (* (car sns) (car sns)))))))))

(max-alternating-sum '(1 2 3)) ; => 12
(max-alternating-sum '(1 -1 2 -2 3 -3)) ; => 16
