#lang racket

(provide balanced?)

(define (balanced? str)
  (let ((cleaned-str (list->string 
                      (filter
                       (lambda (c)
                         (member c (string->list "(){}[]")))
                       (string->list str))))
        (reduce (lambda (str)
                  ((compose
                    (lambda (s)
                      (string-replace s "()" ""))
                    (lambda (s)
                      (string-replace s "{}" ""))
                    (lambda (s)
                      (string-replace s "[]" "")))
                   str))))
    (let ((reduced-str (reduce cleaned-str)))
      (cond ((string=? reduced-str cleaned-str) (string=? "" reduced-str))
            (else (balanced? reduced-str))))))
