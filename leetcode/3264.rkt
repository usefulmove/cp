#lang racket

(define (get-final-state nums k multiplier)
  (let ((get-min-ind (lambda (lst)
                       (let loop ((ns lst)
                                  (ind 0)
                                  (min-ind 0)
                                  (min-so-far 2e32))
                         (if (empty? ns)
                             min-ind
                             (if (< (car ns) min-so-far)
                                 (loop (cdr ns)
                                       (+ ind 1)
                                       ind
                                       (car ns))
                                 (loop (cdr ns)
                                       (+ ind 1)
                                       min-ind
                                       min-so-far))))))
        (update-nums (lambda (ns ind)
                       (append (take ns ind)
                               (list (* multiplier (list-ref ns ind)))
                               (drop ns (+ ind 1))))))
    (let loop ((ns nums)
               (i k))
      (if (= i 0)
          ns
          (loop (update-nums ns (get-min-ind ns))
                (- i 1))))))

(get-final-state '(2 1 3 5 6) 5 2)
(get-final-state '(1 2) 3 4)
(get-final-state '(4) 5 5)
(get-final-state '(5 25) 10 5)
