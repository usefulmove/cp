(define/contract (check-divisibility n)
  (-> exact-integer? boolean?)
  (let ((digit-sum (let loop ((a n) (sum 0))
          (if (zero? a)
              sum
              (loop (quotient a 10)
                    (+ sum (remainder a 10))))))
        (digit-prod (let loop ((b n) (prod 1))
          (if (zero? b)
              prod
              (loop (quotient b 10)
                    (* prod (remainder  b 10)))))))
    (zero? (remainder n (+ digit-sum digit-prod)))))
