;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun acronym (phrase)
  (let ((words (split-string phrase "[ \f\t\n\r\v\-]+"))
        (char-alpha-p (lambda (c)
                        (let ((c (downcase c)))
                          (<= ?a c ?z)))))
    (mapconcat
     (lambda (word)
       (letrec ((find-letter (lambda (lst)
                           (cond ((null lst) "")
                                 ((funcall char-alpha-p (car lst))
                                  (upcase (string (car lst))))
                                 (t (funcall find-letter (cdr lst)))))))
         (funcall find-letter (string-to-list word))))
     words
     "")))


(provide 'acronym)
;;; acronym.el ends here
