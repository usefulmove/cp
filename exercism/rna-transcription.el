;;; rna-transcription.el -- RNA Transcription (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(defun to-rna (strand)
  (let ((transcribe (lambda (nuc)
                      (cond ((eq ?A nuc) ?U)
                            ((eq ?C nuc) ?G)
                            ((eq ?G nuc) ?C)
                            ((eq ?T nuc) ?A)))))
    (mapconcat
     (lambda (c)
       (when (not (member c '(?A ?C ?G ?T)))
         (error "invalid input"))
       (string (funcall transcribe c)))
     (string-to-list strand)
     "")))

(provide 'rna-transcription)
;;; rna-transcription.el ends here
