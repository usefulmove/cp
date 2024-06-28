(defun anagrams-for (subject candidates)
  (let* ((target (downcase subject))
         (sorted-target-chars (sort (string-to-list target) '<)))
    (cl-remove-if-not
     (lambda (candidate)
       (let ((candidate (downcase candidate)))
         (and (not (equal target candidate))
              (equal sorted-target-chars
                     (sort (string-to-list candidate) '<)))))
     candidates)))

(anagrams-for "StoP" '("sTOp"))
(anagrams-for "PoTS" '("sTOp"))
(anagrams-for "PoTS" '("sTOp" "ptOs"))
(anagrams-for "Orchestra" '("cashregister" "Carthorse" "radishes"))
