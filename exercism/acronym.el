;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun acronym (phrase)
  (let ((words (split-string phrase "[-_ \f\t\n\r\v]+" t)))
    (mapconcat
     (lambda (word)
       (upcase (substring word 0 1)))
     words
     "")))


(provide 'acronym)
;;; acronym.el ends here
