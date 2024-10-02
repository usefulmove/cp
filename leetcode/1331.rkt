#lang racket

(define (array-rank-transform arr)
  (let* ((rank-assoc (foldl
                      (lambda (n acc)
                        todo)
                      '()
                      arr)) ; rank association :: [int . int]
         (value->rank (lambda (value) (assoc value rank-assoc)))) ; (int -> int)
    (map
     value->rank
     arr)))
