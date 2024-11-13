(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

(defun make-magnificent-maybe (f nums)
  (mapcar f nums))

(defun only-the-best (f nums)
  (remove-if
   (lambda (num)
     (or (= 1 num)
         (funcall f num)))
   nums))
