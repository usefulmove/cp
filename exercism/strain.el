;;; strain.el --- Strain (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun keep (predicate list)
  (cond ((null list) '())
        ((funcall predicate (car list)) (cons (car list)
                                              (keep predicate (cdr list))))
        (t (keep predicate (cdr list)))))


(defun discard (predicate list)
  (cond ((null list) '())
        ((funcall predicate (car list)) (discard predicate (cdr list)))
        (t (cons (car list)
                 (discard predicate (cdr list))))))


(provide 'strain)
;;; strain.el ends here

