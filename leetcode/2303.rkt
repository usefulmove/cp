#lang racket

(define (calculate-tax brackets income)
  (let ((income-rates (let loop ((bkts (cons '(0 0) brackets))
                                 (income-rates '()))
                        (if (empty? (cdr bkts))
                            income-rates
                            (let* ((upper (first (second bkts)))
                                   (lower (first (first bkts)))
                                   (rate (/ (second (second bkts)) 100.0))
                                   (income-at-bracket (min (- upper lower) (- income lower))))
                              (loop (cdr bkts)
                                    (cons (list (max income-at-bracket 0) rate)
                                          income-rates)))))))
    (foldl
     (lambda (irp acc) (+ acc (* (first irp)
                               (second irp))))
     0.0
     income-rates)))

(calculate-tax '((3 50) (7 10) (12 25)) 10) ; => 2.65
(calculate-tax '((1 0) (4 25) (5 50)) 2) ; => 0.25
(calculate-tax '((2 50)) 0) ; => 0.0
