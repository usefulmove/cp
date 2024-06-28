;;; pangram.el --- Pangram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun pangramp (phrase)
  (let ((phrase (downcase phrase)))
    (seq-reduce
     (lambda (acc c)
       (message (prin1-to-string c))
       (and acc
            (not (null (member
                        c
                        (string-to-list phrase))))))
     (string-to-list "abcdefghijklmnopqrstuvwxyz")
     t)))


(provide 'pangram)
;;; pangram.el ends here
