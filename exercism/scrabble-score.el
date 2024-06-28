;;; scrabble-score.el --- Scrabble Score (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun score (word)
  (seq-reduce
   (lambda (acc c)
     (+ acc (cond ((member c '(?q ?z)) 10)
                  ((member c '(?j ?x)) 8)
                  ((member c '(?k)) 5)
                  ((member c '(?f ?h ?v ?w ?y)) 4)
                  ((member c '(?b ?c ?m ?p)) 3)
                  ((member c '(?d ?g)) 2)
                  (t 1))))
   (string-to-list (downcase word))
   0))

(provide 'scrabble-score)
;;; scrabble-score.el ends here
