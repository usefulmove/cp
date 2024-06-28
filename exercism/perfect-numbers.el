;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun classify (number)
  (cond ((<= number 0)
         (error "Classification is only possible for natural numbers"))
        (t (let* ((aliquot (seq-reduce
                            (lambda (acc a)
                              (+ acc (if (and (< a number)
                                              (= 0 (mod number a)))
                                         (+ a (if (and (not (= a (/ number a)))
                                                       (not (= number (/ number a))))
                                                  (/ number a)
                                                0))
                                       0)))
                            (number-sequence 1 (cl-isqrt number))
                            0)))
             (message (prin1-to-string aliquot))
             (cond ((= number aliquot) 'perfect)
                   ((< number aliquot) 'abundant)
                   ((> number aliquot) 'deficient))))))


(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
