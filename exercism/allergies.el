;;; allergies.el --- Allergies Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(setq allergens '(("eggs" . 1)
                  ("peanuts" . 2)
                  ("shellfish" . 4)
                  ("strawberries" . 8)
                  ("tomatoes" . 16)
                  ("chocolate" . 32)
                  ("pollen" . 64)
                  ("cats" . 128)))


(defun allergen-list (score)
  (seq-reduce
   (lambda (acc pair)
     (let ((allergen (car pair)))
       (if (allergic-to-p score allergen)
           (cons allergen acc)
         acc)))
   (reverse allergens)
   '()))


(defun allergic-to-p (score allergen)
  (not (= 0 (logand score (cdr (assoc allergen allergens))))))



(provide 'allergies)
;;; allergies.el ends here
