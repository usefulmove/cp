(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
  (let* ((rainsounds '((3 . "Pling") (5 . "Plang") (7 . "Plong")))
         (sounds (reduce
                  (lambda (a b) (concatenate 'string a b))
                  (mapcar
                   (lambda (pair)
                     (if (zerop (mod n (car pair)))
                         (cdr pair)
                         ""))
                   rainsounds))))
    (if (equal "" sounds)
        (write-to-string n)
      sounds)))
