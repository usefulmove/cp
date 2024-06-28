;;; collatz-conjecture.el --- Collatz Conjecture (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun steps (number)
  "Count the steps to reach 1 using the Collatz conjecture."
  (cond ((or (< number 1)
             (not (integerp number))) (error "invalid input"))
        ((= 1 number) 0)
        ((= 0 (mod number 2)) (1+ (steps (/ number 2))))
        ((= 1 (mod number 2)) (1+ (steps (+ 1 (* 3 number)))))))

(provide 'collatz-conjecture)
;;; collatz-conjecture.el ends here
