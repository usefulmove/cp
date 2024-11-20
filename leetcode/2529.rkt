#lang racket

(define/contract (maximum-count nums)
  (-> (listof exact-integer?) exact-integer?)
  (let loop ((ns nums)
             (count-pos 0)
             (count-neg 0))
    (cond ((empty? ns) (max count-pos count-neg))
          ((> (car ns) 0) (loop (cdr ns)
                                (+ count-pos 1)
                                count-neg))
          ((< (car ns) 0) (loop (cdr ns)
                                count-pos
                                (+ count-neg 1)))
          (else (loop (cdr ns)
                      count-pos
                      count-neg)))))

#;(define/contract (maximum-count nums)
  (-> (listof exact-integer?) exact-integer?)
  (apply max
         (foldl
          (lambda (num acc)
            (cond ((zero? num) acc) ; no change
                  ((< num 0) (list (add1 (car acc)) ; add neg
                                   (cadr acc)))
                  (else (list (car acc)
                              (add1 (cadr acc)))))) ; add pos
          '(0 0) ; (count-neg count-pos)
          nums)))

(maximum-count '(-2 -1 -1 1 2 3))
(maximum-count '(-3 -2 -1 0 0 1 2))
(maximum-count '(5 20 66 1314))
