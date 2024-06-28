;;; hamming.el --- Hamming (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun hamming-distance (dna1 dna2)
  (when (not (= (length dna1)
              (length dna2)))
      (error "strand lengths are not equal"))

  (seq-reduce
   (lambda (acc p)
     (+ acc (if (equal (car p)
                       (cadr p)) 0 1)))
   (o-zip (string-to-list dna1)
          (string-to-list dna2))
   0))

;; o-zip :: [T] -> [U] -> ... -> [[T U ...]]
(defun o-zip (&rest lsts)
  "Zip lists (LSTS) together and return a list of lists in which the first
element is a list of the first elements of each list. The resulting zipped list
will have the same length as the shortest of the provided lists."
  (letrec ((any-null-p (lambda (lst)
                    (cond ((null lst) nil)
                          ((null (car lst)) t)
                          (t (funcall any-null-p (cdr lst)))))))
    (cond ((null lsts) '())
          ((funcall any-null-p lsts) '())
          (t (cons (apply 'list (mapcar 'car lsts))
                   (apply 'o-zip (mapcar 'cdr lsts)))))))

(provide 'hamming)
;;; hamming.el ends here
