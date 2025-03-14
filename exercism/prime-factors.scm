(define (sieve limit)
  (let ((nums (make-vector (+ limit 1) #t)))  ; Boolean vector to mark primes
    (vector-set! nums 0 #f)
    (vector-set! nums 1 #f)
    (do ((p 2 (+ p 1)))  ; start checking at 2
        ((> (* p p) limit))  ; stop at sqrt(limit)
      (when (vector-ref nums p)
        (do ((multiple (* p p) (+ multiple p)))
            ((> multiple limit))
          (vector-set! nums multiple #f))))
    (let loop ((n 2)
               (primes '()))
      (if (> n limit)
          (reverse primes)
          (loop (+ n 1)
                (if (vector-ref nums n)
                    (cons n primes)
                    primes))))))

(define primes (sieve 894119))

#;(define primes
  '(2 3 5 7 11 13 17 19 23 29  
    31 37 41 43 47 53 59 61 67 71  
    73 79 83 89 97 101 103 107 109 113  
    127 131 137 139 149 151 157 163 167 173  
    179 181 191 193 197 199 211 223 227 229  
    233 239 241 251 257 263 269 271 277 281  
    283 293 307 311 313 317 331 337 347 349  
    353 359 367 373 379 383 389 397 401 409  
    419 421 431 433 439 443 449 457 461 463  
    467 479 487 491 499 503 509 521 523 541))

(define (prime? n)
  (cond ((<= n 1) #f)
        ((= n 2) #t)
        ((even? n) #f)
        (else
         (let loop ((i 3))
           (cond ((> (* i i) n) #t)
                 ((zero? (remainder n i)) #f)
                 (else (loop (+ i 2))))))))

(define (factorize n . out)
  (if (prime? n)
      (cons n out)
      (let loop ((ps primes))
        (if (zero? (mod n (car ps)))
            (factorize (/ n (car ps)) todo)))))

(define (factorize n)
  (if (< n 2)
      '()
      (let loop ((a n)
                 (factors '())
                 (ps primes))
        (if (prime? a)
            (cons a factors)
            (if (zero? (mod a (car ps)))
                (loop (/ a (car ps))
                      (cons (car ps) factors)
                      primes)
                (loop a
                      factors
                      (cdr ps)))))))
