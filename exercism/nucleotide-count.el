;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun nucleotide-count (sequence)
  (seq-reduce
   (lambda (acc nucleotide)
     (when (not (member nucleotide '(?A ?C ?G ?T)))
       (error "invalid nucleotide input"))
     (let ((current-pair (assoc nucleotide acc)))
       (cons (cons nucleotide (+ 1 (cdr current-pair)))
             (remove current-pair acc))))
   (string-to-list sequence)
   '((?A . 0) (?C . 0) (?G . 0) (?T . 0))))


(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
