#lang racket

(provide color-code)

(define (color-code colors)
  (let ((colors-assoc '(("black" . 0)
                        ("brown" . 1)
                        ("red" . 2)
                        ("orange" . 3)
                        ("yellow" . 4)
                        ("green" . 5)
                        ("blue" . 6)
                        ("violet" . 7)
                        ("grey" . 8)
                        ("white" . 9))))
    (+ (* 10 (cdr (assoc (car colors) colors-assoc)))
       (cdr (assoc (cadr colors) colors-assoc)))))
