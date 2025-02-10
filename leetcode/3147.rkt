#lang racket

(define (clear-digits s)
  (let loop ((cs (string->list s))
             (out '()))
    (cond ((empty? cs) (list->string (reverse out))) ; return output
          ((char-numeric? (first cs)) (loop (rest cs)
                                            (rest out)))
            ; drop current character and remove previous from output
          (else (loop (rest cs)
                      (cons (first cs) out)))))) ; keep character

#;(define (clear-digits s)
  (let* ((reduce (lambda (s)
                   (let loop ((cs (reverse (string->list s)))
                              (out '()))
                     (cond ((empty? cs) (list->string out)) ; return output
                           ((and (char-numeric? (first cs))
                                 (char-alphabetic? (second cs)))
                            (loop (cddr cs) out)) ; skip characters
                           (else (loop (rest cs)
                                       (cons (first cs) out)))))))
         (reduced-s (reduce s)))
    (if (equal? s reduced-s)
        s
        (clear-digits reduced-s))))

(clear-digits "abc") ; => "abc"
(clear-digits "cb34") ; => ""
