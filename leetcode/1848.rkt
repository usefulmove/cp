(define/contract (get-min-distance nums target start)
  (-> (listof exact-integer?) exact-integer? exact-integer? exact-integer?)
  (apply min (filter-map
              (lambda (ind num)
                (and (= target num)
                     (abs (- start ind))))
              (range (length nums))
              nums)))
