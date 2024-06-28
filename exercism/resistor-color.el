;;; resistor-color.el --- Resistor Color (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defconst color-values
  '(("black" . 0)
    ("brown" . 1)
    ("red" . 2)
    ("orange" . 3)
    ("yellow" . 4)
    ("green" . 5)
    ("blue" . 6)
    ("violet" . 7)
    ("grey" . 8)
    ("white" . 9)))

(defun color-code (color)
  (let ((match-pair (assoc color color-values)))
    (if match-pair
        (cdr match-pair)
      -1)))

(defun colors ()
  (mapcar 'car color-values))


(provide 'resistor-color)
;;; resistor-color.el ends here
