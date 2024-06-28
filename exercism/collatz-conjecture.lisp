(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  (cond ((< n 1) nil)
        ((= 1 n) 0)
        ((evenp n) (1+ (collatz (/ n 2))))
        ((oddp n) (1+ (collatz (+ 1 (* 3 n)))))))
