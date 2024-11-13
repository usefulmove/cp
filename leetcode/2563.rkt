#lang racket

(define (memoize f)
  (define cache (make-hash))
  (lambda (x)
    (hash-ref! cache x (lambda ()
                         (f x)))))

(define (count-fair-pairs nums lower upper)
  (let ((sum-fair? (memoize (lambda (s)
                              (and (>= s lower)
                                   (<= s upper))))))
    (let loop ((ns nums)
               (cnt 0))
      (if (empty? ns)
          cnt
          (let ((n (car ns))
                (rst (cdr ns)))
            (loop rst
                  (+ cnt (let recur ((lst rst)
                                     (ccnt 0))
                           (if (empty? lst)
                               ccnt
                               (recur (cdr lst)
                                      (+ ccnt (let* ((m (car lst))
                                                     (sm (+ m n)))
                                                (if (sum-fair? sm) 1 0)))))))))))))

(define (count-fair-pairs nums lower upper)
  (let loop ((ns nums)
             (cnt 0))
    (if (empty? ns)
        cnt
        (let ((n (car ns))
              (rst (cdr ns)))
          (loop rst
                (+ cnt (count
                        (lambda (m)
                          (let* ((sm (+ n m)))
                            (and (>= sm lower)
                                 (<= sm upper))))
                        rst)))))))

(count-fair-pairs '(0 1 7 4 4 5) 3 6)
(count-fair-pairs '(1 7 9 2 5) 11 11)
