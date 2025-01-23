#lang racket

(define (transpose nss)
  (apply map list nss))

(define (count-servers grid)
  (let* ((count 0)
         (grid-transposed (transpose grid))
         (has-row-partner? (lambda (i j (g grid))
                             (> (apply + (list-ref g j)) 1)))
         (has-col-partner? (lambda (i j)
                             (has-row-partner? j i grid-transposed))))
    (for ((j (range (length grid))))
      (for ((i (range (length (car grid)))))
        (let ((n (list-ref (list-ref grid j) i)))
          (cond ((and (= n 1)
                      (or (has-col-partner? i j)
                          (has-row-partner? i j))) (set! count (+ count 1)))
                (else (void))))))
    count))

(count-servers '((1 0) (0 1)))
(count-servers '((1 0) (1 1)))
(count-servers '((1 1 0 0) (0 0 1 0) (0 0 1 0) (0 0 0 1)))
