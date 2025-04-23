#lang racket

(define (count-largest-group n)
  (letrec ((count-largest-groups (lambda (groups)
                                   (let ((group-lengths
                                          (map length (hash-values groups))))
                                     (let loop ((lens group-lengths)
                                                (longest 0)
                                                (longest-count 0))
                                       (cond ((empty? lens) longest-count)
                                             ((> (car lens) longest)
                                              (loop (cdr lens)
                                                    (car lens)
                                                    1))
                                             ((= (car lens) longest)
                                              (loop (cdr lens)
                                                    longest
                                                    (add1 longest-count)))
                                             (else (loop (cdr lens)
                                                         longest
                                                         longest-count)))))))
           (sum-digits (lambda (a)
                         (if (< a 10)
                             a
                             (+ (modulo a 10)
                                (sum-digits (quotient a 10)))))))
    (let loop ((num 1)
               (groups (hash)))
      (if (> num n)
          (count-largest-groups groups)
          (let* ((sum (sum-digits num))
                 (nums (hash-ref groups sum #f)))
            (if nums
                (loop (add1 num)
                      (hash-set groups sum (cons num nums)))
                (loop (add1 num)
                      (hash-set groups sum (list num)))))))))

(count-largest-group 13) ; => 4
(count-largest-group 2) ; => 2
