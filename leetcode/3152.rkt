#lang racket

(define (is-array-special nums queries)
  (let ((special? (lambda (l)
                    (let loop ((ns l)
                               (output #t)
                               (parity (= 0 (remainder (car l) 2))))
                      (if (empty? ns)
                          output
                          (loop (cdr ns)
                                (and (equal? parity
                                             (= 0 (remainder (car ns) 2))) output)
                                (not parity)))))))
    (map
     (lambda (q)
       (let* ((from (first q))
              (to (second q))
              (sub (drop (take nums (+ to 1)) from)))
         (special? sub)))
     queries)))

(is-array-special '(3 4 1 2 6) '((0 4)))
(is-array-special '(4 3 1 6) '((0 2) (2 3)))
