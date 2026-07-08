(define/contract (check-good-integer n)
  (-> exact-integer? boolean?)
  (let* ((square (lambda (a) (* a a)))
         (digit-sum (lambda (a)
                       (apply + (map
                                 (lambda (c) (- (char->integer c) 48))
                                 (string->list (number->string a))))))
         (square-sum (lambda (a)
                       (apply + (map
                                 (lambda (c) (square (- (char->integer c) 48)))
                                 (string->list (number->string a)))))))
    (>= (- (square-sum n)
           (digit-sum n))
        50)))
