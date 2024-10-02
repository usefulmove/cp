#lang racket

(define (array-rank-transform arr)
  (let ((rank-assoc todo) ; rank association :: [int]
        (learn-assoc (lambda (value rank-assoc) ; (int -> [int] -> (int -> int))
                       todo-return-rank))
        (value->rank (learn-assoc rank-assoc))) ; (int -> int)
    (map
     value->rank
     arr)))
