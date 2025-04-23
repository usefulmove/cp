#lang racket

(define (count-largest-group n)
  (letrec ((count-largest (lambda (lengths)
                            (let loop ((lens lengths)
                                       (longest 0)
                                       (cnt 0))
                              (cond ((empty? lens) cnt)
                                    ((> (car lens) longest) (loop (cdr lens)
                                                                  (car lens)
                                                                  1))
                                    ((= (car lens) longest) (loop (cdr lens)
                                                                  longest
                                                                  (add1 cnt)))
                                    (else (loop (cdr lens)
                                                longest
                                                cnt))))))
           (sum-digits (lambda (a) (if (< a 10)
                                       a
                                       (+ (modulo a 10)
                                          (sum-digits (quotient a 10)))))))
    (let loop ((num 1)
               (groups (hash)))
      (if (> num n)
          (count-largest (map length (hash-values groups)))
          (let* ((sum (sum-digits num))
                 (nums (hash-ref groups sum #f)))
            (if nums
                (loop (add1 num)
                      (hash-set groups sum (cons num nums)))
                (loop (add1 num)
                      (hash-set groups sum (list num)))))))))

(count-largest-group 13) ; => 4
(count-largest-group 2) ; => 2
