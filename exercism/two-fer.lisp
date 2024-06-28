(defpackage :two-fer
  (:use :cl)
  (:export :twofer))
(in-package :two-fer)

(defun twofer (&optional name)
  (format NIL "One for ~a, one for me." (if name name "you")))
