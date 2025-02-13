#lang racket

(define (min-operations nums k)
  (let ((get-mins (lambda (ns)
                    (let loop ((nums ns)
                               (index 0)
                               (out '((1e32 . 1e32) . (1e32 . 1e32))))
                               ;'(a . i) . (b . j) where a < b
                      (if (empty? nums)
                          out
                          (let ((num (car nums))
                                (a (caar out))
                                (i (cdar out))
                                (b (cadr out))
                                (j (cddr out)))
                            (loop (cdr nums)
                                  (+ index 1)
                                  (cond ((< num a) (cons (cons num index)
                                                         (cons a i)))
                                        ((< num b) (cons (cons a i)
                                                         (cons num index)))
                                        (else out)))))))))
    (let loop ((ns nums)
               (operations 0))
      (cond ((>= (apply min ns) k) operations)
            ((< (length ns) 2) (error))
            (else (let* ((min-pairs (get-mins ns))
                         (a (caar min-pairs))
                         (i (cdar min-pairs))
                         (b (cadr min-pairs))
                         (j (cddr min-pairs))
                         (ns-rest (append (take ns (min i j))
                                          (take
                                           (drop ns (+ (min i j) 1))
                                           (- (abs (- j i)) 1))
                                          (drop ns (+ (max i j) 1)))))
                    (loop (cons (+ (* a 2) b) ns-rest)
                          (+ operations 1))))))))

(min-operations '(2 11 10 1 3) 10) ; => 2
(min-operations '(1 1 2 4 9) 20) ; => 4
