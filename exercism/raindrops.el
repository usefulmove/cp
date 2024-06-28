;(defun convert (n)
;  (let ((output ""))
;    (when (= 0 (mod n 3)) (setq output (concat output "Pling")))
;    (when (= 0 (mod n 5)) (setq output (concat output "Plang")))
;    (when (= 0 (mod n 7)) (setq output (concat output "Plong")))
;    (if (equal "" output)
;        (number-to-string n)
;      output)))


(defun convert (n)
  "Convert integer N to its raindrops string."
  (let* ((rainspeak '((3 . "Pling") (5 . "Plang") (7 . "Plong")))
         (sounds (mapconcat
                  (lambda (pair) (if (zerop (mod n (car pair)))
                                     (cdr pair)
                                   ""))
                  rainspeak
                  nil)))
    (if (equal "" sounds)
        (number-to-string n)
      sounds)))


(convert 34)
(convert 105)
