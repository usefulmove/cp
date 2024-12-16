#lang racket

(define (get-final-state nums k multiplier)
  (let ((get-min-index (lambda (lst)
                         (let loop ((ns lst)
                                    (ind 0)
                                    (min-index -1)
                                    (min-so-far 999))
                           (if (empty? ns)
                               min-index
                               (if (< (car ns) min-so-far)
                                   (loop (cdr ns)
                                         (+ ind 1)
                                         ind
                                         (car ns))
                                   (loop (cdr ns)
                                         (+ ind 1)
                                         min-index
                                         min-so-far))))))
        (update-nums (lambda (ns ind)
                       (append (take ns ind)
                               (list (* multiplier (list-ref ns ind)))
                               (drop ns (+ ind 1))))))
    (let loop ((ns nums)
               (i k))
      (if (= i 0)
          ns
          (loop (update-nums ns (get-min-index ns))
                (- i 1))))))

(get-final-state '(2 1 3 5 6) 5 2)
(get-final-state '(1 2) 3 4)
