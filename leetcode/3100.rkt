#lang racket

(define (max-bottles-drunk num-bottles num-exchange)
  (let loop ((fulls num-bottles)
             (empties 0)
             (num-exc num-exchange)
             (drunk 0))
    (cond ((and (zero? fulls)
                (< empties num-exc)) drunk)
          ((zero? fulls) (loop (+ fulls 1) ; exchange empties
                               (- empties num-exc)
                               (+ num-exc 1)
                               drunk))
          (else (loop 0 ; empty fulls
                      (+ empties fulls)
                      num-exc
                      (+ drunk fulls))))))

  (max-bottles-drunk 13 6)
  (max-bottles-drunk 10 3)
