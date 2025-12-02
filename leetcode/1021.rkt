#lang racket

(define (remove-outer-parentheses s)
  (let loop ((cs (string->list s))
             (depth 0)
             (out '()))
    (if (empty? cs)
        (list->string (reverse out))
        (cond ((and (= 0 depth) 
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
                          (cons #\) out)))))))


(remove-outer-parentheses "(()())(())")         ; => "()()()"
(remove-outer-parentheses "(()())(())(()(()))") ; => "()()()()(())"
(remove-outer-parentheses "()()")               ; => ""
