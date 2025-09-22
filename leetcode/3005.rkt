#lang racket

(define (max-frequency-elements nums)
  (let* ((counts (let loop ((ns nums)
                            (cnts '())) ; assoc list
                   (if (empty? ns)
                       (reverse cnts)
                       (let* ((n (car ns))
                              (ind (index-of (map car cnts) n)))
                         (loop (cdr ns)
                               (if ind
                                   (append (take cnts ind)
                                           (let ((n-cnt (cdr
                                                         (list-ref cnts ind))))
                                             (list (cons n (+ n-cnt 1))))
                                           (drop cnts (+ ind 1)))
                                   (cons (cons n 1) cnts)))))))
         (max-elems (let loop ((cnts counts)
                               (max-freq 0)
                               (max-cnts '()))
                      (cond ((empty? cnts) max-cnts)
                            ((> (cdar cnts) max-freq)
                             (loop (cdr cnts)
                                   (cdar cnts)
                                   (list (car cnts))))
                            ((= (cdar cnts) max-freq)
                             (loop (cdr cnts)
                                   max-freq
                                   (cons (car cnts) max-cnts)))
                            (else (loop (cdr cnts)
                                        max-freq
                                        max-cnts))))))
    (foldl
     (lambda (cnt sum) (+ sum (cdr cnt)))
     0
     max-elems)))

(max-frequency-elements '(1 2 2 3 1 4))
(max-frequency-elements '(1 2 3 4 5))
