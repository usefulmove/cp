;;; isbn-verifier.el --- ISBN Verifier (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun foldl (f acc lst)
  (cond ((null lst) acc)
        (t (foldl f (funcall f acc (car lst)) (cdr lst)))))


(defun zip (lst1 lst2)
  (cond ((or (null lst1)
             (null lst2)) '())
        (t (cons (cons (car lst1)
                       (car lst2))
                 (zip (cdr lst1)
                      (cdr lst2))))))


(defun range (&rest args)
  (let ((from (if (= 1 (length args))
                  0
                (car args)))
        (to (if (= 1 (length args))
                (car args)
              (cadr args)))
        (step (if (= 3 (length args))
                  (caddr args)
                1)))
    (cond ((>= from to) '())
          (t (cons from (range (+ step from) to step))))))


(defun validp (isbn)
  (let* ((chars (cl-remove-if
                 (lambda (c)
                   (= c 45)) ; remove hyphens
                 (string-to-list isbn)))
         (nums (mapcar
                (lambda (c)
                  (if (= c 88)
                      10
                    (- c ?0)))
                chars))
         (comp (foldl ; weighted sum computation
                (lambda (acc pair)
                  (let ((index (car pair))
                        (n (cdr pair)))
                    (+ acc (* n index))))
                0
                (zip (range 1 11)
                     (reverse nums)))))
    (if (or (not (= 10 (length nums)))
            (> (length (member 10 nums)) 1))
        nil
      (= 0 (mod comp 11)))))


(provide 'isbn-verifier)
;;; isbn-verifier.el ends here
