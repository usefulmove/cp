#lang racket

(define (reverse-parentheses s)
  (let ((remove-parens-and-reverse (lambda (s)
                                     (list->string
                                      (cdr (reverse
                                            (cdr (string->list s))))))))
    (if (string-contains? s "(")
        (reverse-parentheses (regexp-replace*
                              #rx"\\([a-z]*\\)"
                              s
                              remove-parens-and-reverse))
        s)))

(reverse-parentheses "(abcd)")
(reverse-parentheses "(u(love)i)")
(reverse-parentheses "(ed(et(oc))el)")
(reverse-parentheses "vdgzyj()")
