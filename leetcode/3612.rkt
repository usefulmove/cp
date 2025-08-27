#lang racket

(define (process-string s)
  (let loop ((cs (string->list s)) (out '()))
    (if (empty? cs)
        (list->string (reverse out))
        (let ((c (car cs)))
          (cond ((equal? #\* c) (loop (cdr cs)
                                      (if (empty? out) '() (cdr out))))
                ((equal? #\# c) (loop (cdr cs)
                                      (append out out)))
                ((equal? #\% c) (loop (cdr cs)
                                      (reverse out)))
                (else (loop (cdr cs)
                            (cons c out))))))))

(process-string "a#b%*") ; => "ba"
(process-string "z*#") ; => ""
(process-string "*%") ; => ""
