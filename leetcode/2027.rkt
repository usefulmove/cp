#lang racket

(define (minimum-moves s)
  (let loop ((cs (string->list s))
             (moves 0))
    (cond ((empty? cs) moves)
          ((equal? #\X (car cs)) (loop (if (> (length cs) 2)
                                           (drop cs 3)
                                           '())
                                       (+ moves 1)))
          (else (loop (cdr cs) moves)))))

(minimum-moves "XXX")
(minimum-moves "XXOX")
(minimum-moves "OOOO")
