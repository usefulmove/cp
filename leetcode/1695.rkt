#lang racket

(define (maximum-unique-subarray nums)
  ; sliding window algorithm (recursive)
  (let* ((vec-nums (list->vector nums))
         (limit (vector-length vec-nums)))
    (let recur ((i 0)
                (j 0)
                (contents (set))
                (score 0)
                (max-score 0))
      (if (= j limit)
          max-score
          (let ((a (vector-ref vec-nums i))
                (b (vector-ref vec-nums j)))
            (if (set-member? contents b)
                (recur (add1 i)
                       j
                       (set-remove contents a)
                       (- score a)
                       max-score)
                (recur i
                       (add1 j)
                       (set-add contents b)
                       (+ score b)
                       (max max-score (+ score b)))))))))

#;(define (maximum-unique-subarray nums)
  ; sliding window algorithm
  (let* ((score 0)
         (max-score 0)
         (i 0)
         (j 0)
         (contents (set))
         (vec-nums (list->vector nums))
         (limit (vector-length vec-nums)))
    (let loop ()
      (let ((b (vector-ref vec-nums j)))
        (let shrink ()
          (when (set-member? contents b)
            (let ((a (vector-ref vec-nums i)))
              (set! contents (set-remove contents a))
              (set! score (- score a))
              (set! i (add1 i))
              (shrink))))
        (set! contents (set-add contents b))
        (set! score (+ score b))
        (set! max-score (max max-score score))
        (set! j (add1 j))
        (if (= j limit) max-score (loop))))))

#;(define (maximum-unique-subarray nums)
  ; sliding window algorithm
  (let* ((score 0)
         (max-score 0)
         (i 0)
         (j 0)
         (contains (set))
         (vec-nums (list->vector nums))
         (limit (vector-length vec-nums)))
    (let loop ()
      (let ((a (vector-ref vec-nums i))
            (b (vector-ref vec-nums j)))
        (if (set-member? contains b)
            (begin
              (set! contains (set-remove contains a))
              (set! score (- score a))
              (set! i (add1 i)))
            (begin
              (set! contains (set-add contains b))
              (set! score (+ score b))
              (set! max-score (max max-score score))
              (set! j (add1 j))))
        (if (= j limit) max-score (loop))))))

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
