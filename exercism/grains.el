;;; grains.el --- Grains exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun square (n)
  (expt 2 (- n 1)))

(defun total ()
  (cl-labels ((recurse (n)
                (if (= 0 n)
                    0
                  (+ (square n)
                     (recurse (- n 1))))))
       (recurse 64)))

(provide 'grains)
;;; grains.el ends here
