#lang racket

(define (zero-filled-subarray nums)
  (let ((tng (lambda (a) ; triangular number
               (/ (* a (+ a 1)) 2))))
    (let loop ((ns nums) (cnt 0) (acc 0))
      (cond ((empty? ns) (+ acc (tng cnt)))
            ((zero? (car ns)) (loop (cdr ns)
                                    (+ cnt 1)
                                    acc))
            (else (loop (cdr ns)
                        0 ; reset
                        (+ acc (tng cnt))))))))

#;(define (zero-filled-subarray nums)
  (let loop ((ns nums) (cnt 0) (counts '()))
    (cond ((empty? ns) (let recur ((cnts (cons cnt counts))
                                   (out 0))
                         (if (empty? cnts)
                             out
                             (recur (cdr cnts)
                                    (+ out
                                       (/ (* (car cnts)
                                             (+ (car cnts) 1))
                                          2))))))
          ((zero? (car ns)) (loop (cdr ns)
                                  (+ cnt 1)
                                  counts))
          (else (loop (cdr ns)
                      0 ; reset
                      (cons cnt counts))))))

#;(define (zero-filled-subarray nums)
  (let loop ((ns nums) (cnt 0) (counts '()))
    (cond ((empty? ns) (foldl
                        (lambda (c acc)
                          (+ acc (/ (* c (+ c 1)) 2)))
                        0
                        (cons cnt counts)))
          ((zero? (car ns)) (loop (cdr ns)
                                  (+ cnt 1)
                                  counts))
          (else (loop (cdr ns)
                      0 ; reset
                      (cons cnt counts))))))

(zero-filled-subarray '(1 3 0 0 2 0 0 4)) ; => 6
(zero-filled-subarray '(0 0 0 2 0 0)) ; => 9
(zero-filled-subarray '(2 10 2019)) ; => 0
