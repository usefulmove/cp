#lang racket

(define (array-rank-transform vals)
  (let* ((value-rank-assoc (foldl ; rank assoc :: [int . int]
                            (lambda (val acc-so-far)
                              (cond ((null? acc-so-far) (list (cons val 1)))
                                    ((assoc val acc-so-far) acc-so-far)
                                    (else ; add val
                                          (map ; map from rank to value using rank assoc
                                           (lambda (rank)
                                             (if (todo)
                                              ; rank exists in value-rank association so far                                                 (if (< rank val)
                                                     (cons rank (assoc rank acc-so-far))
                                                     (cons rank (+ 1 (assoc rank acc-so-far))))
                                                 (cons (cons val rank) acc-so-far)))
                                           (range 1 (+ 1 (length acc-so-far)))))))
                            '() ; value-rank assoc accumulator [value . rank] :: [int . int]
                            vals))
         (value->rank (lambda (value) (assoc value value-rank-assoc)))) ; :: (int -> int)
    (map
     value->rank
     vals)))

(array-rank-transform '(100 200 300))
