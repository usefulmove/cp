(setq lexical-binding t)

(defun list-foldl (fun lst accu)
  (if (null lst)
      accu
    (list-foldl
     fun
     (cdr lst)
     (funcall fun accu (car lst)))))

(defun list-foldr (fun lst accu)
  (list-foldl
   (lambda (a b) (funcall fun b a))
   (reverse lst)
   accu))

(defun list-empty-p (lst)
  (null lst))

(defun list-sum (lst)
  (apply '+ lst))

(defun list-length (lst &optional acc)
  (if (null lst)
      (or acc 0)
    (list-length (cdr lst) (+ 1 (or acc 0)))))

(defun list-append (lst1 lst2)
  (seq-reduce
   (lambda (acc a) (cons a acc))
   (list-reverse lst1)
   lst2))

(defun list-reverse (lst)
  (seq-reduce
   (lambda (acc a) (cons a acc))
   lst
   nil))

(defun list-concatenate (lst1 lst2 &rest LISTS)
  (let ((lst-of-lsts (cons lst1 (cons lst2 LISTS))))
    (seq-reduce
     (lambda (acc lst) (list-append acc lst))
     lst-of-lsts
     nil)))

(defun list-filter (lst predicate)
  (seq-reduce
   (lambda (acc a) (if (funcall predicate a)
                       (cons a acc)
                       acc))
   (list-reverse lst)
   nil))

(defun list-map (lst fun)
  (seq-reduce
   (lambda (acc a) (cons (funcall fun a) acc))
   (list-reverse lst)
   nil))
