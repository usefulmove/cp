#lang racket

(provide color-code colors)

(define color-assoc 
  '(("black" . 0)
    ("brown" . 1)
    ("red" . 2)
    ("orange" . 3)
    ("yellow" . 4)
    ("green" . 5)
    ("blue" . 6)
    ("violet" . 7)
    ("grey" . 8)
    ("white" . 9)))

(define (color-code color)
  (cdr (assoc color color-assoc)))

(define (colors)
  (map car color-assoc))
