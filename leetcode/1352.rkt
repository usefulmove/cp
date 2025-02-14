(define product-of-numbers%
  (class object%
    (super-new)
    
    (init-field)
    (field (nums '()))
    
    ; add : exact-integer? -> void?
    (define/public (add num)
      (set! nums (cons num nums)))
    
    ; get-product : exact-integer? -> exact-integer?
    (define/public (get-product k)
      (let loop ((ns nums)
                 (product 1)
                 (count 0))
        (if (or (empty? ns)
                (= count k))
            product
            (loop (cdr ns)
                  (* product (car ns))
                  (+ count 1)))))))

;; Your product-of-numbers% object will be instantiated and called as such:
;; (define obj (new product-of-numbers%))
;; (send obj add num)
;; (define param_2 (send obj get-product k))
