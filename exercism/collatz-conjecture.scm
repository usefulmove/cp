(import (rnrs))

(define (collatz n)
  (cond ((= 1 n) 0)
        ((even? n) (add1 (collatz (/ n 2))))
        ((odd? n) (add1 (collatz (+ 1 (* 3 n)))))))
