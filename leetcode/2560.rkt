#lang racket

;; greedy check: can we pick k houses with values <= cap?
(define (can-pick? nums k cap)
  (letrec ((helper (lambda (lst count)
                     (cond ((<= count 0) #t) ; picked enough houses.
                           ((null? lst) #f)  ; ran out of houses.
                           ((<= (car lst) cap)
                            ;; pick current house and skip the next one.
                            (helper
                             (if (null? (cdr lst)) '() (cdr (cdr lst)))
                             (sub1 count)))
                           (else (helper (cdr lst) count)))))) ; skip current house.
    (helper nums k)))

;; binary search over possible maximum values.
(define (min-capability nums k)
  (letrec ((low (apply min nums))
           (high (apply max nums))
           (loop (lambda (l h)
                   (if (= l h)
                       l
                       (let* ((mid (quotient (+ l h) 2)))
                         (if (can-pick? nums k mid)
                             (loop l mid)
                             (loop (+ mid 1) h)))))))
    (loop low high)))

#;(define (min-capability nums k)
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
                                         (add1 cnt)
                                         (cons (list-ref nums index)
                                               acc))))))))
    (for ((ind (range len-nums)))
      (walk-paths! ind 0 '()))
    (apply min (map
                (lambda (path) (apply max path))
                paths))))

(min-capability '(2 3 5 9) 2) ; => 5
(min-capability '(2 7 9 3 1) 2) ; => 2
