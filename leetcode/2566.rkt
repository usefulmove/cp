#lang racket

(define (min-max-difference num)
  (let ((maximize (lambda (digs)
                    (let loop ((ds digs)
                               (remap -1)
                               (out '()))
                      (cond ((empty? ds) (reverse out))
                            ((and (= -1 remap)
                                  (= 9 (car ds))) (loop (cdr ds) ; continue
                                                        -1
                                                        (cons (car ds) out)))
                            ((= -1 remap) (loop (cdr ds)
                                                (car ds) ; set remap
                                                (cons 9 out))) ; remap
                            ((= remap (car ds)) (loop (cdr ds)
                                                      remap
                                                      (cons 9 out))) ; remap
                            (else (loop (cdr ds)
                                        remap
                                        (cons (car ds) out)))))))
        (minimize (lambda (digs)
                    (let loop ((ds digs)
                               (remap -1)
                               (out '()))
                      (cond ((empty? ds) (reverse out))
                            ((and (= -1 remap)
                                  (= 0 (car ds))) (loop (cdr ds) ; continue
                                                        -1
                                                        (cons (car ds) out)))
                            ((= -1 remap) (loop (cdr ds)
                                                (car ds) ; set remap
                                                (cons 0 out))) ; remap
                            ((= remap (car ds)) (loop (cdr ds)
                                                      remap
                                                      (cons 0 out))) ; remap
                            (else (loop (cdr ds)
                                        remap
                                        (cons (car ds) out)))))))
        (digits (map
                 (lambda (c) (- (char->integer c)
                                (char->integer #\0)))
                 (string->list (number->string num))))
        (convert-digits (lambda (digs)
                          (let loop ((ds digs)
                                     (out 0))
                            (if (empty? ds)
                                out
                                (loop (cdr ds)
                                      (+ (car ds) (* out 10))))))))
    (- (convert-digits (maximize digits))
       (convert-digits (minimize digits)))))

(min-max-difference 11891) ; => 99009
(min-max-difference 90) ; => 99
