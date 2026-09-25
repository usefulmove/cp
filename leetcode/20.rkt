(define/contract (is-valid s)
  (-> string? boolean?)
  (let ([paren-reduce (lambda (s)
                        (regexp-replace* #rx"\\(\\)|\\{\\}|\\[\\]" s ""))])
    (cond [(equal? "" s) #t]
          [(equal? s (paren-reduce s)) #f]
          [else (is-valid (paren-reduce s))])))
