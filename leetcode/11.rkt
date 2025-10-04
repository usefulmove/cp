#lang racket

#|
Implemented as a two-pointer, shrinking window problem operating on a vector (rather than a list) for performance optimization in accessing values efficiently in the array. Starting with left and right values at the ends of the vector, if the left is lower than the right, move the left in. Otherwise, move in the right, keeping track of the most water capacity observed until the left and right meet.
|#

(define (max-area height)
  (let ((hs (list->vector height)))
    (let loop ((i 0)
               (j (- (vector-length hs) 1))
               (most-water 0))
      (let* ((left (vector-ref hs i))
             (right (vector-ref hs j))
             (can-hold (* (min left right) (- j i))))
        (cond ((<= j i) most-water) ; end search
              ((< left right) (loop (+ i 1) ; move in left
                                    j
                                    (max can-hold most-water)))
              (else (loop i
                          (- j 1) ; move in right
                          (max can-hold most-water))))))))

#;(define (max-area height)
  (let loop ((hs height)
             (width (length height))
             (most-water 0))
    (let* ((left (first hs))
           (right (last hs))
           (can-hold (* (min left right) (- width 1))))
      (cond ((< width 2) most-water)
            ((< left right) (loop (rest hs)
                                  (- width 1)
                                  (max most-water can-hold)))
            (else (loop (take hs (- width 1))
                        (- width 1)
                        (max most-water can-hold)))))))

(max-area '(1 8 6 2 5 4 8 3 7))
(max-area '(1 1))
