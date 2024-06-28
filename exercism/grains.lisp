(defpackage :grains
  (:use :cl)
  (:export :square :total))
(in-package :grains)

(defun square (n)
  (expt 2 (- n 1)))

(defun total ()
  (apply #'+ (mapcar
	       #'square
	       (loop for i from 1 below (+ 1 64) by 1 collect i))))
