#lang racket

(define (number-game nums)
  (let loop ((ns (sort nums <))
             (out '()))
    (if (empty? ns)
        out
        (loop (drop ns 2)
              (append out (list (cadr ns) (car ns)))))))

(number-game '(5 4 2 3)) ; => '(3 2 5 4)
(number-game '(2 5)) ; => '(5 2)
