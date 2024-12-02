#lang racket

(provide rotate)

(define (rotate text key)
  (let* ((alphas (map
                  (lambda (n)
                    (integer->char (+ n 97)))
                  (range 26)))
         (rotated-alphas (append (drop alphas key)
                                 (take alphas key)))
         (list-index (lambda (f lst)
                       (let loop ((as lst)
                                  (ind 0))
                         (cond ((empty? as) -1)
                               ((f (car as)) ind)
                               (else (loop (cdr as)
                                           (+ ind 1))))))))
    (list->string (map
                   (lambda (c)
                     (let ((i (list-index
                               (lambda (d) (equal? (char-downcase c) d))
                               alphas))
                           (upper (char-upper-case? c)))
                       (if (< i 0)
                           c
                           (if upper
                               (char-upcase (list-ref rotated-alphas i))
                               (list-ref rotated-alphas i)))))
                   (string->list text)))))


(rotate "omg" 5) ; => "trl"
(rotate "c" 0) ; => "c"
(rotate "OMG" 5) ; "TRL"
(rotate "The quick brown fox jumps over the lazy dog." 13) ; => "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
