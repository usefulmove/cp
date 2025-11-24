#lang racket

#|
Iterate through each digit (`(remainder num 10)`) of `n` from right to left and for each non-zero digit, keep track of the sum of digits (`mult`) and the reconstructed number (`base`), and a scaling factor (`m`) used to calculate the reconstructed number at each non-zero step. When a zero digit is encountered, skip it and leave each of the tracked values unchanged. Once the iteration is complete (`(zero? num)`), return the reconstructed base multiplied by the multiplier (digit sum).
 |#

(define (sum-and-multiply n)
  (let loop ((num n)
             (base 0)
             (m 1)
             (mult 0))
    (if (zero? num)
        (* base mult)
        (let ((quot (quotient num 10))
              (rem (remainder num 10)))
          (if (zero? rem)
              (loop quot base m mult)
              (loop quot
                    (+ base (* rem m))
                    (* m 10)
                    (+ mult rem)))))))

(sum-and-multiply 10203004) ; => 12340
(sum-and-multiply 100) ; => 1
