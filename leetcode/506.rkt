#lang racket

(define (find-relative-ranks scores)
  (let ((enumerated-scores (enumerate-reverse (sort scores >))))
    (map
     (lambda (score)
       (let* ((pair (assoc score enumerated-scores))
              (rank (+ 1 (cdr pair))))
         (cond ((= 1 rank) "Gold Medal")
               ((= 2 rank) "Silver Medal")
               ((= 3 rank) "Bronze Medal")
               (else (number->string rank)))))
     scores)))

(define (enumerate-reverse lst . params)
  (let ((index (if (not (null? params)) (car params) 0)))
    (cond ((null? lst) '())
          (else (cons (cons (car lst)
                            index)
                      (enumerate-reverse (cdr lst) (+ 1 index)))))))

(find-relative-ranks '(5 4 3 2 1))
(find-relative-ranks '(10 3 8 9 4))
