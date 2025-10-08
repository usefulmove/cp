#lang racket

(define (num-water-bottles num-bottles num-exchange)
  (let loop ((fulls num-bottles)
             (empties 0)
             (drunks 0))
    (cond ((positive? fulls) (loop 0
                                   (+ empties fulls)
                                   (+ drunks fulls)))
          ((>= empties num-exchange) (loop (+ fulls 1)
                                           (- empties num-exchange)
                                           drunks))
          (else drunks))))

(num-water-bottles 9 3)
(num-water-bottles 15 4)
