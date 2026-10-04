(define/contract (array-sign nums)
    (-> (listof exact-integer?) exact-integer?)
    (let ([f (lambda (a acc) (* acc (sgn a)))])
      (foldl f 1 nums)))
