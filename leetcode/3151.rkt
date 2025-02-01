#lang racket

(define (is-special-array nums)
  (let ((get-polarity (lambda (num)
                        (remainder num 2))))
    (andmap
     (lambda (a b)
       (not (= (get-polarity a)
               (get-polarity b))))
     (take nums (- (length nums) 1))
     (cdr nums))))

#;(define (is-special-array nums)
  (let ((get-polarity (lambda (num)
                        (remainder num 2)))
        (flip-pole (lambda (pole)
                     (if (= pole 0) 1 0))))
    (cdr (foldl
          (lambda (num pair)
            (let ((expected-polarity (car pair))
                  (result (cdr pair)))
              (cons (flip-pole expected-polarity)
                    (and result
                         (= expected-polarity
                            (get-polarity num))))))
          (cons (get-polarity (car nums)) #t) ; '(expected-polarity . result)
          nums))))

#;(define (is-special-array nums)
  (let ((get-polarity (lambda (num)
                    (remainder num 2)))
        (flip-pole (lambda (pole)
                     (if (= pole 0) 1 0))))
    (let loop ((array nums)
               (expected-polarity (get-polarity (first nums))))
      (if (empty? array)
          #t ; special array
          (and (= expected-polarity
                  (get-polarity (first array)))
               (loop (rest array)
                     (flip-pole expected-polarity)))))))

(is-special-array '(1))
(is-special-array '(2 1 4))
(is-special-array '(4 3 1 6))
