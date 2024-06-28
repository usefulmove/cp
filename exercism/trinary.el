;;; trinary.el --- Trinary (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun trinary-to-decimal (string)
  (catch 'return
      (letrec ((char-to-digit (lambda (c) (- c ?0)))
               (digits (seq-reduce
                        (lambda (acc c)
                          (if (not (member
                                    (funcall char-to-digit c)
                                    '(0 1 2)))
                              (throw 'return 0)
                            (cons (funcall char-to-digit c) acc)))
                        (string-to-list string)
                        '()))
               (process (lambda (digs acc ind)
                          (cond ((null digs) acc)
                                (t (let ((dig (car digs))
                                         (rest (cdr digs)))
                                     (funcall
                                      process
                                      rest
                                      (+ acc (* dig (expt 3 ind)))
                                      (+ ind 1))))))))
        (funcall process digits 0 0))))


(provide 'trinary)
;;; trinary.el ends here
