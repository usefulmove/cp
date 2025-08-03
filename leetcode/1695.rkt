#lang racket

(define (maximum-unique-subarray nums)
  (let ((sublist (lambda (lst start count)
                   (take (drop lst start) count)))
        (all-unique? (lambda (lst)
                       (= (length lst)
                          (length (remove-duplicates lst))))))
    (let recur ((ns nums)
                (cnt 1)
                (max-so-far 0))
      (cond ((empty? ns) max-so-far)
            ((or (> cnt (length ns))
                 (not (all-unique? (sublist ns 0 cnt)))) (recur (cdr ns)
                                                                1 ; reset
                                                                max-so-far))
            ((> (apply + (sublist ns 0 cnt)) max-so-far)
             (recur ns
                    (add1 cnt)
                    (apply + (sublist ns 0 cnt))))
            (else (recur ns
                         (add1 cnt)
                         max-so-far))))))

(maximum-unique-subarray '(4 2 4 5 6)) ; 17
(maximum-unique-subarray '(5 2 1 2 5 2 1 2 5)) ; 8
(maximum-unique-subarray '(10000 1 10000 1 1 1 1 1 1)) ; 10001
