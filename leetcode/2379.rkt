#lang racket

(define/contract (minimum-recolors blocks k)
  (-> string? exact-integer? exact-integer?)
  (let ((count-recolors (lambda (bs) (count
                                      (lambda (b) (equal? b #\W))
                                      (take bs k)))))
    (let loop ((bs (string->list blocks))
               (recolors 2e32))
      (cond ((< (length bs) k) recolors)
            (else (let ((comp-recolors (count-recolors bs)))
                    (loop (cdr bs)
                          (if (< comp-recolors recolors)
                              comp-recolors
                              recolors))))))))

(minimum-recolors "WBBWWBBWBW" 7)
(minimum-recolors "WBWBBBW" 2)
