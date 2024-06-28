;;; luhn.el --- Luhn exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(require 'cl-lib)

(defun luhn-p (str)
  (let* ((digits (mapcar
                  (lambda (c) (- c ?0))
                  (cl-remove 32 (string-to-list str))))
         (sum (cdr (seq-reduce
                    (lambda (acc digit)
                      (if (not (member digit '(0 1 2 3 4 5 6 7 8 9)))
                          (error "invalid input")
                        (let ((index (car acc))
                              (total (cdr acc))
                              (double-and-set (lambda (n)
                                                (let ((double (+ n n)))
                                                  (if (> double 9)
                                                      (- double 9)
                                                    double)))))
                          (if (= 0 (mod index 2))
                              (cons (1+ index)
                                    (+ total digit))
                            (cons (1+ index)
                                  (+ total (funcall double-and-set digit)))))))
                    (reverse digits)
                    '(0 . 0))))) ; (index . total)
    (if (< (length digits) 2)
        nil
      (= 0 (mod sum 10)))))

(provide 'luhn)
;;; luhn.el ends here
