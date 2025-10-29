#lang racket

(define (common-chars words)
  (foldl
   (lambda (word acc)
     todo)
   '()
   (map
    (lambda (word) 
      (list->set (string->list word)))
    words)))

(common-chars '("bella" "label" "roller")))
