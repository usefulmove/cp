#lang racket

(provide balanced?)

(define (balanced? str)
  (let* ((cleaned-str (list->string 
                       (filter
                        (lambda (c)
                          (member c (string->list "(){}[]")))
                        (string->list str))))
         (string-remove (lambda (rem)
                          (lambda (s)
                            (string-replace s rem ""))))
         (reduce (lambda (str)
                   ((compose
                     (string-remove "()")
                     (string-remove "{}")
                     (string-remove "[]"))
                    str)))
         (reduced-str (reduce cleaned-str)))
    (if (string=? reduced-str cleaned-str) ; converged (won't reduce)
        (string=? "" reduced-str) ; check for empty string
        (balanced? reduced-str)))) ; continue reduction
