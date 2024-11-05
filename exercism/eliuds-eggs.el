(defun int-to-binary (n)
  (if (<= n 0)
      "0"
    (let ((output ""))
      (while (> n 0)
        (setq output (concat (number-to-string (% n 2)) output))
        (setq n (/ n 2)))
      output)))

(defun egg-count (number)
  (seq-reduce
   (lambda (acc c)
     (+ acc (if (equal c ?1) 1 0)))
   (int-to-binary number)
   0))
