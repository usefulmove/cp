(define/contract (find-max-consecutive-ones nums)
  (-> (listof exact-integer?) exact-integer?)
  (let ((ones-lens (map
                     string-length
                     (string-split
                       (apply string-append (map number->string nums))
                       "0"))))
    (if (null? ones-lens)
      0
      (apply max ones-lens))))
