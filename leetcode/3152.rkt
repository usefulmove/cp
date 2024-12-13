#lang racket

(define (is-array-special nums queries)
  (let* ((parities (map
                    (lambda (n)
                      (= 0 (remainder n 2)))
                    nums))
         (special? (lambda (l)
                     (let loop ((ps l)
                                (output #t)
                                (parity (car l)))
                       (if (empty? ps)
                           output
                           (loop (cdr ps)
                                 (and (equal? parity (car ps)) output)
                                 (not parity)))))))
    (map
     (lambda (q)
       (let* ((from (first q))
              (to (second q))
              (sub (drop (take parities (+ to 1)) from)))
         (special? sub)))
     queries)))

(is-array-special '(3 4 1 2 6) '((0 4)))
(is-array-special '(4 3 1 6) '((0 2) (2 3)))
