#lang racket

(define (divide-strong s k fill)
  (map
   (compose list->string reverse)
   (let loop ((chars (string->list s))
              (out '(())))
     (let ((coe (car out))) ; current output element
       (cond ((and (empty? chars)
                   (= (length coe) k)) (reverse out)) ; return output
             ((empty? chars) (loop '()
                                   (cons (append (make-list
                                                  (- k (length coe))
                                                  fill)
                                                 coe)
                                         (cdr out))))
             (else (loop (cdr chars)
                         (if (= k (length coe))
                             (cons (list (car chars))
                                   out)
                             (cons (cons (car chars) coe)
                                   (cdr out))))))))))

(divide-strong "abcdefghi" 3 #\x)
(divide-strong "abcdefghij" 3 #\x)
