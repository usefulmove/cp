#lang racket

(define (shifting-letters s shifts)
  (let* ((alpha-root (char->integer #\a))
         (shift-char (lambda (c shift)
                       (integer->char (+ (remainder
                                          (- (+ (char->integer c)
                                                shift)
                                             alpha-root)
                                          26)
                                         alpha-root)))))
    (list->string
     (let loop ((cs (reverse (string->list s)))
                (ss (reverse shifts))
                (acc 0)
                (output '()))
       (if (empty? cs)
           output
           (let ((c (car cs))
                 (shift (car ss)))
             (loop (cdr cs)
                   (cdr ss)
                   (+ acc shift)
                   (cons (shift-char c (+ shift acc)) output))))))))

(shifting-letters "abc" '(3 5 9)) ; => "rpl"
(shifting-letters "aaa" '(1 2 3)) ; => "gfd"
(shifting-letters "bad" '(10 20 30)) ; => "jyh"
