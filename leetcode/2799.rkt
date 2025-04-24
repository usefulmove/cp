#lang racket

(define (count-complete-subarrays nums)
  (let* ((count-distincts (lambda (lst)
                            (length (remove-duplicates lst))))
         (distinct-nums (count-distincts nums))
         (len (length nums))
         (sublist (lambda (lst a b)
                    (drop (take lst (add1 b)) a)))
         (cnt 0))
    (for ((i (range len)))
      (for ((j (range i len)))
        (when (= (count-distincts (sublist nums i j))
                 distinct-nums)
          (set! cnt (add1 cnt)))))
    cnt))

(count-complete-subarrays '(1 3 1 2 2)) ; => 4
(count-complete-subarrays '(5 5 5 5)) ; => 10
