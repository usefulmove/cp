(define/contract (climb-stairs n)
  (-> exact-integer? exact-integer?)
    (define (fibonacci2 n a b)
      (if (= n 0)
          a
          (if (= n 1)
              b 
              (fibonacci2 (- n 1) b (+ a b)))))
                 
    (fibonacci2 (+ n 1) 0 1))
