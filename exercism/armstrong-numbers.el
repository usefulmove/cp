;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun armstrong-p (n)
  (let ((generate-number (lambda (n)
                           (let ((digits (mapcar
                                          (lambda (c) (- c ?0))
                                          (string-to-list
                                           (number-to-string n)))))
                             (seq-reduce
                              (lambda (acc digit)
                                (+ acc (expt digit (length digits))))
                              digits
                              0)))))
    (= n (funcall generate-number n))))


(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
