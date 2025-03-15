#lang racket

#;(define (rob nums)
  (cond ((empty? nums) 0)
        ((empty? (cdr nums)) (car nums))
        ((empty? (cddr nums)) (apply max nums))
        (else (max (+ (car nums) (rob (cddr nums)))
                   (+ (cadr nums) (rob (cdddr nums)))))))

(define (rob nums)
  (letrec ((cache (make-hash))
           (cache-identity (lambda (key val)
                             (hash-set! cache key val)
                             val))
           (cache-has? (lambda (key)
                         (hash-ref cache key #f)))
           (cache-retrieve (lambda (key)
                             (hash-ref cache key)))
           (rob-index (lambda (ind ns)
                        (let ((len (length ns)))
                          (cond ((cache-has? ind) (cache-retrieve ind))
                                ((= len 1) (cache-identity ind (car ns)))
                                ((= len 2) (cache-identity ind (max (car ns)
                                                                    (cadr ns))))
                                (else (cache-identity
                                       ind
                                       (max (+ (car ns)
                                               (rob-index (+ ind 2) (cddr ns)))
                                            (rob-index (+ ind 1) (cdr ns))))))))))
    (rob-index 0 nums)))

(rob '(1 2 3 1)) ; => 4
(rob '(2 7 9 3 1)) ; => 12
