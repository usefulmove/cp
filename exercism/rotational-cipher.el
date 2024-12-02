(defun rotate (text key)
  (let* ((alphas (mapcar
                  (lambda (n) (+ n 97))
                  (number-sequence 0 25)))
         (rotated-alphas (append (nthcdr key alphas)
                                 (cl-subseq alphas 0 key)))
         (list-index (lambda (f lst)
                       (let ((ind 0))
                         (catch 'found
                           (dolist (elem lst -1)
                             (when (funcall f elem)
                               (throw 'found ind))
                             (setq ind (1+ ind))))))))
    (apply #'string (mapcar
                     (lambda (c)
                       (let* ((i (funcall list-index
                                          (lambda (d) (= (downcase c) d))
                                          alphas))
                              (upper (and (>= c ?A) (<= c ?Z))))
                         (if (< i 0)
                             c
                           (let ((rotated (nth i rotated-alphas)))
                             (if upper (upcase rotated) rotated)))))
                     text))))    
