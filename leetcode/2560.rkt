#lang racket

(define (min-capability nums k)
  (letrec ((len-nums (length nums))
           (paths '())
           (walk-paths! (lambda (index cnt acc)
                          (cond ((= cnt k) (set! paths (cons acc paths)))
                                ((= (add1 cnt) k) (walk-paths!
                                                   -1
                                                   (add1 cnt)
                                                   (cons (list-ref nums index)
                                                         acc)))
                                (else (for ((i (range (+ index 2) len-nums)))
                                        (walk-paths!
                                         i
                                         (add1 cnt))
                                         (cons (list-ref nums index)
                                               acc))))))))
    (for ((ind (range len-nums)))
      (walk-paths! ind 0 '()))
    (apply min (map
                (lambda (path) (apply max path))
                paths))))

(min-capability '(2 3 5 9) 2) ; => 5
(min-capability '(2 7 9 3 1) 2) ; => 2
