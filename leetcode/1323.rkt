#lang racket

(define (maximum69-number num)
  (let loop ((cs (string->list (number->string num)))
             (out '())
             (done #f))
    (if (empty? cs)
        (string->number (list->string (reverse out)))
        (loop (cdr cs)
              (cons (if (and (not done)
                             (equal? #\6 (car cs)))
                        #\9
                        (car cs))
                    out)
              (or done (equal? #\6 (car cs)))))))

(maximum69-number 9669) ; 9969
(maximum69-number 9996) ; 9999
(maximum69-number 9999) ; 9999
