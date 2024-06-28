;;; triangle.el --- Triangle (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun equilateralp (sides)
  (let* ((sorted (sort sides '<))
         (a (car sorted))
         (b (cadr sorted))
         (c (caddr sorted)))
    (and (= a b c)
         (not (= 0 a)))))

(defun isoscelesp (sides)
  (let* ((sorted (sort sides '<))
         (a (car sorted))
         (b (cadr sorted))
         (c (caddr sorted)))
    (and (or (= a b)
             (= b c))
         (not (= 0 a b c))
         (< c (+ a b)))))

(defun scalenep (sides)
  (let* ((sorted (sort sides '<))
         (a (car sorted))
         (b (cadr sorted))
         (c (caddr sorted)))
    (and (not (= a b))
         (not (= b c))
         (< c (+ a b)))))

(provide 'triangle)
;;; triangle.el ends here
