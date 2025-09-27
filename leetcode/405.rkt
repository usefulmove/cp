#lang racket

(define (remove-kdigits num k)
  (let* ((digits (string->list num))
         (remove-digit (lambda (digits)
                         (let loop ((digs digits)
                                    (done #f)
                                    (out '()))
                           (cond ((and (empty? digs) done) (reverse out))
                                 #;((empty? digs) (loop digs
                                                      #t
                                                      (cdr out)))
                                 (done (loop (cdr digs)
                                             done
                                             (cons (car digs) out)))
                                 ((equal? (cdr digs) '()) (loop (cdr digs)
                                                                #t
                                                                out))
                                 ((> (char->integer (car digs))
                                     (char->integer (cadr digs))) (loop (cdr digs)
                                                   #t
                                                   out))
                                 (else (loop (cdr digs)
                                             done
                                             (cons (car digs) out)))))))
         (cleaned-digits (let recur ((n k)
                                     (out digits))
                           (if (zero? n)
                               out
                               (recur (- n 1)
                                      (remove-digit out)))))
         (remove-leading-zeros (lambda (digits)
                                 (let loop ((digs digits)
                                            (done #f)
                                            (out '()))
                                   (cond ((empty? digs) (reverse out))
                                         ((and (not done)
                                               (equal? (car digs) #\0)) (loop (cdr digs)
                                                                                done
                                                                                out))
                                         (else (loop (cdr digs)
                                                     #t
                                                     (cons (car digs) out)))))))
         (output (remove-leading-zeros cleaned-digits)))
    (if (empty? output)
        "0"
        (list->string output))))

(remove-kdigits "1423219" 3)
(remove-kdigits "10200" 1)
(remove-kdigits "10" 2)
