(import (rnrs))

(define (convert number)
  (let ((message (fold-left
                  (lambda (acc pair)
                    (let ((divisor (car pair))
                          (tag (cdr pair)))
                      (if (zero? (mod number divisor))
                          (string-append acc tag)
                          acc)))
                  ""
                  '((3 . "Pling") (5 . "Plang") (7 . "Plong")))))
    (if (string=? "" message)
        (number->string number)
        message)))
