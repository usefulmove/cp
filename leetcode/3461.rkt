#lang racket

(define (has-same-digits s)
  (letrec ((reduce (lambda (ns)
                     (let ((res (foldl
                                 (lambda (a b acc)
                                   (cons (remainder (+ a b) 10)
                                         acc))
                                 '()
                                 (take ns (- (length ns) 1))
                                 (cdr ns))))
                       (if (= (length res) 2)
                           res
                           (reduce res)))))
           (reduced (reduce (map
                             (lambda (c) (- (char->integer c) 48))
                             (string->list s)))))
    (= (car reduced)
       (cadr reduced))))

(has-same-digits "3902")
(has-same-digits "34789")
