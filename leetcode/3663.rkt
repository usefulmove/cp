#lang racket

(define (get-least-frequent-digit n)
  (let ((counts (let loop ((num n)
                           (counts (make-list 10 0)))
                  (if (zero? num)
                      counts
                      (let ((digit (remainder num 10))
                            (rest (quotient num 10)))
                        (loop rest (list-set
                                    counts
                                    digit
                                    (+ (list-ref counts digit) 1))))))))
    (let loop ((cnts counts)
               (index 0)
               (minimum 99)
               (min-digit -1))
      (cond ((empty? cnts) min-digit)
            ((= (car cnts) 0)
             (loop (cdr cnts) (+ index 1) minimum min-digit))
            ((< (car cnts) minimum) 
             (loop (cdr cnts) (+ index 1) (car cnts) index))
            (else
             (loop (cdr cnts) (+ index 1) minimum min-digit))))))

(get-least-frequent-digit 1553322) ; => 1
(get-least-frequent-digit 723344511) ; => 2
