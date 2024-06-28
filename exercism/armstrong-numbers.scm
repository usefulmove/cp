(import (rnrs))

(define (armstrong-number? n)
  (let* ((digits (map
                  (lambda (c) (- (char->integer c)
                                 (char->integer #\0)))
                  (string->list (number->string n))))
         (n-digits (length digits)))
    (= n (fold-left
          (lambda (acc digit)
            (+ acc (expt digit n-digits)))
          0
          digits))))
