#lang racket

(define (is-special-array nums)
  (let ((polarity (lambda (num)
                    (remainder num 2)))
        (flip-pole (lambda (pole)
                     (if (= pole 0) 1 0))))
    (let loop ((array nums)
               (expected-polarity (polarity (car nums))))
      (if (empty? array)
          #t ; special array
          (and (= expected-polarity
                  (polarity (car array)))
               (loop (cdr array)
                     (flip-pole expected-polarity)))))))

(is-special-array '(1))
(is-special-array '(2 1 4))
(is-special-array '(4 3 1 6))
