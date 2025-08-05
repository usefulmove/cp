#lang racket

(require racket/set)

(define (maximum-unique-subarray nums)
  ; sliding window algorithm
  (let ((score 0)
        (max-score 0)
        (i 0)
        (j 0)
        (contains (set))
        (limit (length nums)))
    (do ((_ 0 (void)))
        ((= j limit) max-score)
      (begin
        (let ((a (list-ref nums i))
              (b (list-ref nums j)))
          (if (set-member? contains b)
              (begin
                (set! contains (set-remove contains a))
                (set! score (- score a))
                (set! i (add1 i)))
              (begin
                (set! contains (set-add contains b))
                (set! score (+ score b))
                (set! max-score (max max-score score))
                (set! j (add1 j)))))))
    max-score))

#;(define (maximum-unique-subarray nums)
  (let ((all-unique? (lambda (lst)
                       (= (length lst)
                          (length (remove-duplicates lst))))))
    (let recur ((ns nums)
                (cnt 1)
                (max-so-far 0))
      (if (empty? ns)
          max-so-far
          (cond ((> cnt (length ns)) (recur (cdr ns)
                                            1 ; reset
                                            (max (apply + ns)
                                                 max-so-far)))
                ((all-unique? (take ns cnt)) (recur ns
                                                    (add1 cnt)
                                                    max-so-far))
                (else (recur (cdr ns)
                             1 ; reset
                             (max max-so-far
                                  (apply + (take ns (sub1 cnt)))))))))))

#;(define (maximum-unique-subarray nums)
  (let ((sublist (lambda (lst count)
                   (if (> count (length lst))
                       lst
                       (take lst count))))
        (all-unique? (lambda (lst)
                       (= (length lst)
                          (length (remove-duplicates lst))))))
    (let recur ((ns nums)
                (cnt 1)
                (max-so-far 0))
      (if (empty? ns)
          max-so-far
          (let* ((sublst (sublist ns cnt))
                 (sum (apply + sublst)))
            (cond ((or (> cnt (length ns))
                       (not (all-unique? sublst))) (recur (cdr ns)
                                                          1 ; reset
                                                          max-so-far))
                  ((> sum max-so-far) (recur ns
                                             (add1 cnt)
                                             sum))
                  (else (recur ns
                               (add1 cnt)
                               max-so-far))))))))

(maximum-unique-subarray '(4 2 4 5 6)) ; 17
(maximum-unique-subarray '(5 2 1 2 5 2 1 2 5)) ; 8
(maximum-unique-subarray '(10000 1 10000 1 1 1 1 1 1)) ; 10001
