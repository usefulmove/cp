#lang racket

(define (max-containers n weight max-weight)
  (let ((allowed-by-space (* n n))
        (allowed-by-weight (quotient max-weight weight)))
    (min allowed-by-space allowed-by-weight)))

(max-containers 2 3 15) ; => 4
(max-containers 3 5 20) ; => 4
