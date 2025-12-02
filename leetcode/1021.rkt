#lang racket

#|
    Iterate through the list of characters and keep track of
    the nesting depth and the accumulated output based on the
    depth.
 |#

(define (remove-outer-parentheses s)
  (let loop ((cs (string->list s))
             (depth 0)
             (out '()))
    (cond ((empty? cs) (list->string (reverse out)))
          ((and (= 0 depth) 
                (equal? #\( (car cs))) (loop (cdr cs)
                                             (+ depth 1)
                                             out))
          ((and (= 1 depth) 
                (equal? #\) (car cs))) (loop (cdr cs)
                                             (- depth 1)
                                             out))
          ((equal? #\( (car cs)) (loop (cdr cs)
                                       (+ depth 1)
                                       (cons #\( out)))
          (else (loop (cdr cs)
                      (- depth 1)
                      (cons #\) out))))))


(remove-outer-parentheses "(()())(())")         ; => "()()()"
(remove-outer-parentheses "(()())(())(()(()))") ; => "()()()()(())"
(remove-outer-parentheses "()()")               ; => ""
