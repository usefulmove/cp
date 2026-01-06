(define/contract (build-array nums)
  (-> (listof exact-integer?) (listof exact-integer?))
    (map (lambda (a) (list-ref nums a)) nums))
