;;; resistor-color-duo.el --- Resistor Color Duo (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun value (colors)
  (let* ((band-one (car colors))
         (band-two (cadr colors))
         (color-assoc '(("black" . 0)
                        ("brown" . 1)
                        ("red" . 2)
                        ("orange" . 3)
                        ("yellow" . 4)
                        ("green" . 5)
                        ("blue" . 6)
                        ("violet" . 7)
                        ("grey" . 8)
                        ("white" . 9)))
         (color-code (lambda (color)
                       (cdr (assoc color color-assoc)))))
    (+ (* 10 (funcall color-code band-one))
       (funcall color-code band-two))))


(provide 'resistor-color-duo)
;;; resistor-color-duo.el ends here
