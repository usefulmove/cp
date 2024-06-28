;;; accumulate.el --- Accumulate (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun accumulate (lst op)
  (if (null lst)
      '()
    (cons (funcall op (car lst))
          (accumulate (cdr lst) op))))


(provide 'accumulate)
;;; accumulate.el ends here
