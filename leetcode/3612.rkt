#lang racket

(define (process-string s)
  (let loop ((cs (string->list s)) (out '()))
    (if (empty? cs)
        (list->string (reverse out))
        (match (car cs)
          (#\* (loop (cdr cs)
                     (if (empty? out) '() (cdr out))))
          (#\# (loop (cdr cs)
                     (append out out)))
          (#\% (loop (cdr cs)
                     (reverse out)))
          (else (loop (cdr cs)
                      (cons (car cs) out)))))))


#;(define (process-string s)
  (let loop ((cs (string->list s)) (out '()))
    (if (empty? cs)
        (list->string (reverse out))
        (cond ((equal? #\* (car cs)) (loop (cdr cs)
                                           (if (empty? out)
                                               '()
                                               (cdr out))))
              ((equal? #\# (car cs)) (loop (cdr cs)
                                           (append out out)))
              ((equal? #\% (car cs)) (loop (cdr cs)
                                           (reverse out)))
              (else (loop (cdr cs)
                          (cons (car cs) out)))))))

(process-string "a#b%*") ; => "ba"
(process-string "z*#") ; => ""
(process-string "*%") ; => ""
