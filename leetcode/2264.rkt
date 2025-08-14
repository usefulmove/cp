#lang racket

(define (largest-good-integer num)
  (let loop ((cs (string->list num))
             (cnt 1)
             (prev #\nul)
             (out #\nul))
    (cond ((empty? cs) (make-string
                        (if (equal? out #\nul) 0 3)
                        out))
          ((equal? out #\9) (make-string 3 #\9))
          ((not (equal? (car cs) prev)) (loop (cdr cs)
                                              1 ; reset
                                              (car cs)
                                              out))
          ((and (= cnt 2)
                (> (char->integer (car cs))
                   (char->integer out))) (loop (cdr cs)
                                               (+ cnt 1)
                                               (car cs)
                                               (car cs)))
          (else (loop (cdr cs)
                      (+ cnt 1)
                      (car cs)
                      out)))))

(largest-good-integer "6777133339") ; => "777"
(largest-good-integer "42352338") ; => ""
