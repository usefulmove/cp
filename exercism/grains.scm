(define (square n)
  (cond ((< 0 n 65) (expt 2 (- n 1)))
        (else (error "input out of range"))))

(define total
  (let loop ((s 64))
    (cond ((= 0 s) 0)
          (else (+ (square s)
                   (loop (- s 1)))))))

(display total)
(newline)
