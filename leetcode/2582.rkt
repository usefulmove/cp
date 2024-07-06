#lang racket

(define (pass-the-pillow n time)
  (letrec ((iter (lambda (time (ind 1) (dir 1))
                   (if (= 0 time)
                       ind
                       (cond ((= ind 1) (iter (- time 1) 2 1))
                             ((= ind n) (iter (- time 1) (- n 1) -1))
                             (else (iter (- time 1) (+ ind dir) dir)))))))
    (iter time)))

(pass-the-pillow 4 5)
(pass-the-pillow 3 2)
