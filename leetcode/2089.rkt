#lang racket

(define (target-indicies nums target)
  (let loop ((index 0)
             (ns (sort nums <))
             (out '()))
    (if (empty? ns)
        (reverse out)
        (loop (add1 index)
              (cdr ns)
              (if (= target (car ns))
                  (cons index out)
                  out)))))

(target-indicies '(1 2 5 2 3) 2) ; => '(1 2)
(target-indicies '(1 2 5 2 3) 3) ; => '(3)
(target-indicies '(1 2 5 2 3) 5) ; => '(4)
