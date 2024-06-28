#lang racket


(define (make-good s)
  (letrec ((reduce (lambda (s)
                     (let ((len (string-length s))
                           (clist (string->list s)))
                       (cond ((< len 2) s)
                             ((let ((ord1 (char->integer (car clist)))
                                    (ord2 (char->integer (cadr clist))))
                                (= (abs (- ord1 ord2))
                                   32)) (reduce (substring s 2 len)))
                             (else (string-append (substring s 0 1)
                                                  (reduce (substring s 1 len)))))))))
    (let ((reduced-s (reduce s)))
      (if (string=? s reduced-s)
          s
          (make-good reduced-s)))))


(make-good "leEeetcode")
(make-good "abBAcC")
(make-good "s")
(make-good "jeSsEJ")
