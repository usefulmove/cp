#lang racket

(define (furthest-distance-from-origin moves)
  (let ((moves (string->list moves)))
    (if (zero? (count
                (lambda (m) (not (equal? #\_ m)))
                moves))
        (length moves)
        (let loop ((mvs moves)
                   (pos 0))
          (cond ((empty? mvs) (abs pos))
                ((equal? #\L (car mvs)) (loop (cdr mvs)
                                              (- pos 1)))
                ((equal? #\R (car mvs)) (loop (cdr mvs)
                                              (+ pos 1)))
                (else (max (loop (cons #\L (cdr mvs))
                                 pos)
                           (loop (cons #\R (cdr mvs))
                                 pos))))))))

(furthest-distance-from-origin "L_RL__R")
(furthest-distance-from-origin "_R__LL_")
(furthest-distance-from-origin "_______")
