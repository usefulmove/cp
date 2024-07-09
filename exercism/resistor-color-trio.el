;;; resistor-color-trio.el --- Resistor Color Trio (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun label (colors)
  (let* ((kiloohm (expt 10 3))
         (megaohm (expt 10 6))
         (gigaohm (expt 10 9))
         (band-one (car colors))
         (band-two (cadr colors))
         (band-three (caddr colors))
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
         (get-color-value (lambda (color)
                            (cdr (assoc color color-assoc))))
         (base (+ (* 10 (funcall get-color-value band-one))
                  (funcall get-color-value band-two)))
         (n (* base
               (expt 10 (funcall get-color-value band-three)))))
    (cond ((>= n gigaohm) (concat
                           (number-to-string (/ n gigaohm))
                           " gigaohms"))
          ((>= n megaohm) (concat
                           (number-to-string (/ n megaohm))
                           " megaohms"))
          ((>= n kiloohm) (concat
                           (number-to-string (/ n kiloohm))
                           " kiloohms"))
          (t (concat
              (number-to-string n)
              " ohms")))))

(provide 'resistor-color-trio)
;;; resistor-color-trio.el ends here

