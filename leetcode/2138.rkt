#lang racket

(define (divide-strong s k fill)
  (map
   (compose list->string reverse)
   (let loop ((chars (string->list s))
              (out '(())))
     (cond ((and (empty? chars)
                 (= k (length (car out)))) (reverse out))
           ((empty? chars) (reverse (cons (append (make-list
                                                   (- k (length (car out)))
                                                   fill)
                                                  (car out))
                                          (cdr out))))
           (else (loop (cdr chars)
                       (if (= k (length (car out)))
                           (cons (list (car chars))
                                 out)
                           (cons (cons (car chars) (car out))
                                 (cdr out)))))))))

(divide-strong "abcdefghi" 3 #\x)
(divide-strong "abcdefghij" 3 #\x)
