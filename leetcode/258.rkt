#lang racket


(define (add-digits num)
  (let* ((reduce (lambda (n)
                   (foldl
                    (lambda (char acc)
                      (+ acc (- (char->integer char)
                                (char->integer #\0))))
                    0
                    (string->list (number->string n)))))
         (reduced (reduce num)))
    (if (< reduced 10)
        reduced
        (add-digits reduced))))


(add-digits 38)
(add-digits 0)
(add-digits 06181985)
(add-digits 12101975)
