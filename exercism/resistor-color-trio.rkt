#lang racket

(provide color-code)

(define (color-code colors)
  (let* ((kiloohm (expt 10 3))
         (megaohm (expt 10 6))
         (gigaohm (expt 10 9))
         (colors-assoc '(("black" . 0)
                         ("brown" . 1)
                         ("red" . 2)
                         ("orange" . 3)
                         ("yellow" . 4)
                         ("green" . 5)
                         ("blue" . 6)
                         ("violet" . 7)
                         ("grey" . 8)
                         ("white" . 9)))
         (color-one (car colors))
         (color-two (cadr colors))
         (color-three (caddr colors))
         (get-color-value (lambda (color)
                            (cdr (assoc color colors-assoc))))
         (base (+ (* 10 (get-color-value color-one))
                  (get-color-value color-two)))
         (n (* base
               (expt 10 (get-color-value color-three)))))
    (cond ((>= n gigaohm) (string-append
                           (number->string (/ n gigaohm))
                           " gigaohms"))
          ((>= n megaohm) (string-append
                           (number->string (/ n megaohm))
                           " megaohms"))
          ((>= n kiloohm) (string-append
                           (number->string (/ n kiloohm))
                           " kiloohms"))
          (else (string-append
                 (number->string n)
                 " ohms")))))
