#lang racket

(define (minimum-recolors blocks k)
  (let* ((black #\B)
         (white #\W)
         (count-recolors (lambda (bs)
                           (count
                            (lambda (block)
                              (equal? white block))
                            (take bs k)))))
    (let loop ((bs (string->list blocks))
               (recolors 2e32))
      (cond ((< (length bs) k) recolors)
            ((< (count-recolors bs) recolors) (loop (cdr bs)
                                                    (count-recolors bs)))
            (else
             (loop (cdr bs)
                     (let* ((black #\B)
         (white #\W)
         (count-recolors (lambda (bs)
                           (count
                            (lambda (block)
                              (equal? white block))
                            (take bs k)))))
    (let loop ((bs (string->list blocks))
               (recolors 2e32))
      (cond ((< (length bs) k) recolors)
            ((< (count-recolors bs) recolors) (loop (cdr bs)
                                                    (count-recolors bs)))
            (else
             (loop (cdr bs)
                   recolors))))))
recolors))))))

(minimum-recolors "WBBWWBBWBW" 7)
(minimum-recolors "WBWBBBW" 2)
