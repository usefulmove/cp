#lang racket

(define (number-game nums)
  (let loop ((ns (sort nums <)) (swapped '()))
    (if (empty? ns)
        swapped
        (loop (drop ns 2) (append swapped
                                  (list (second ns)
                                        (first ns)))))))

(number-game '(5 4 2 3)) ; => '(3 2 5 4)
(number-game '(2 5)) ; => '(5 2)
