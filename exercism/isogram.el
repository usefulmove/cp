;;; isogram.el --- isogram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun char-alpha-p (c)
  (or (and (>= c ?a) (<= c ?z))
      (and (>= c ?A) (<= c ?Z))))

(defun isogramp (phrase)
  (let* ((seens '())
         (not-seen-p (lambda (c)
                       (if (member c seens)
                           nil
                         (progn
                           (setq seens (cons c seens))
                           t)))))
    (cl-reduce
     (lambda (acc c)
       (if (char-alpha-p c)
           (and acc (funcall not-seen-p c))
         acc)) ; ignore character
     (downcase phrase)
     :initial-value t)))

(isogramp "isogram")
(isogramp "eleven")

(provide 'isogram)
;;; isogram.el ends here
