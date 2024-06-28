#lang racket

(provide convert)

(define (convert number)
  (let ((message (foldl
                  (lambda (pair acc)
                    (let ((divisor (car pair))
                          (tag (cdr pair)))
                      (if (zero? (modulo number divisor))
                          (string-append acc tag)
                          acc)))
                  ""
                  '((3 . "Pling") (5 . "Plang") (7 . "Plong")))))
    (if (string=? "" message)
        (number->string number)
        message)))
