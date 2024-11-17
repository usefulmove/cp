#lang racket

(define (smallest-number n t)
  (let ((digit-product (lambda (num)
                         (foldl
                          (lambda (c acc)
                            (* acc
                               (- (char->integer c)
                                  (char->integer #\0))))
                          1
                          (string->list (number->string num))))))
    (let loop ((num n))
      (if (= 0 (remainder (digit-product num) t))
          num
          (loop (+ num 1))))))

(smallest-number 10 2)
(smallest-number 15 3)
