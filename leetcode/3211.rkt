#lang racket

#;(define (valid-strings n)
  (let loop ((nums (range (expt 2 n)))
             (output '()))
    (if (empty? nums)
        output
        (let* ((s-base (number->string (car nums) 2)) 
               (padding (make-string (- n (string-length s-base)) #\0))
               (s (string-append padding s-base)))
          (loop (cdr nums)
                (if (not (string-contains? s "00"))
                    (cons s output)
                    output))))))

(define (valid-strings n)
  (filter-map
   (lambda (o)
     (let* ((s-base (number->string o 2))
            (padding (make-string (- n (string-length s-base)) #\0))
            (s (string-append padding s-base)))
       (and (not (string-contains? s "00"))
            s)))
   (range (expt 2 n))))

(valid-strings 3)
(valid-strings 1)
