#lang racket

(define/contract (final-position-of-snake n commands)
  (-> exact-integer? (listof string?) exact-integer?)
  (let ((pos (let loop ((cmds commands)
                        (x 0)
                        (y 0))
               (cond ((empty? cmds) (cons x y))
                     ((equal? (car cmds) "UP")
                      (loop (cdr cmds) x (+ y 1)))
                     ((equal? (car cmds) "DOWN")
                      (loop (cdr cmds) x (- y 1)))
                     ((equal? (car cmds) "RIGHT")
                      (loop (cdr cmds) (+ x 1) y))
                     (else
                      (loop (cdr cmds) (- x 1) y)) ))))
    (+ (* n (cdr pos) -1)
       (car pos))))
