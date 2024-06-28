#lang racket


;; core "data types"
;;   board - [int] (length 81)
;;   cell - int (0-80)
;;   row - int (0-8)
;;   col - int (0-8)
;;   box - int (0-8)
;;   digit - int (1-9)


(define original-board '((5 3 #\. #\. 7 #\. #\. #\. #\. ) (6 #\. #\. 1 9 5 #\. #\. #\. ) (#\. 9 8 #\. #\. #\. #\. 6 #\. ) (8 #\. #\. #\. 6 #\. #\. #\. 3) (4 #\. #\. 8 #\. 3 #\. #\. 1) (7 #\. #\. #\. 2 #\. #\. #\. 6) (#\. 6 #\. #\. #\. #\. 2 8 #\. ) (#\. #\. #\. 4 1 9 #\. #\. 5) (#\. #\. #\. #\. 8 #\. #\. 7 9))) 

(define (convert-board board)
  (apply append (map
   (lambda (row)
     (map
      (lambda (cell)
        (if (equal? #\. cell)
            0
            cell))
      row))
   board)))


(define valid-digits
  (range 1 (add1 9)))


(define (display-board board)
  (let ((display-row (lambda (row)
                       (for ((digit (get-row-digits board row)))
                         (display (string-append
                                   " "
                                   (number->string digit)
                                   " ")))
                       (newline))))
    (newline)
    (for ((row (range 9)))
      (display-row row))
    (newline)))


;; get-cell-digit :: board -> cell -> digit
;;                :: [int] -> int -> -> int
(define get-cell-digit list-ref) ; list-ref ( point-free )


;; set-cell-digit :: board -> cell -> digit -> board
;;                :: [int] -> int -> -> int -> [int]
(define (set-cell-digit board cell digit)
  (append (take board cell)
          (list digit)
          (drop board (add1 cell))))


; get-row :: cell -> row
;         :: int -> int
(define (get-row cell)
  (floor (/ cell 9)))


; get-col :: cell -> col
;         :: int -> int
(define (get-col cell)
  (modulo cell 9))


; get-box :: cell -> box
;         :: int -> int
(define (get-box cell)
  (let ((row (get-row cell))
        (col (get-col cell)))
    (+ (* (floor (/ row 3)) 3)
       (floor (/ col 3)))))


(define (zip lst . lsts)
  (apply map list lst lsts))


;; get-row-digits :: board -> row -> [digits]
;;                :: [int] -> int -> [int]
(define (get-row-digits board row)
  (let ((matching-pairs (filter
                         (lambda (pair)
                           (let ((index (car pair))
                                 (digit (cdr pair)))
                             (= row (get-row index))))
                         (zip (range (length board))
                              board))))
    (map
     cadr
     matching-pairs)))


;; get-col-digits :: board -> col -> [digits]
;;                :: [int] -> int -> [int]
(define (get-col-digits board col)
  (let ((matching-pairs (filter
                         (lambda (pair)
                           (let ((index (car pair))
                                 (digit (cdr pair)))
                             (= col (get-col index))))
                         (zip (range (length board))
                              board))))
    (map
     cadr
     matching-pairs)))


;; get-box-digits :: board -> box -> [digits]
;;                :: [int] -> int -> [int]
(define (get-box-digits board box)
  (let ((matching-pairs (filter
                         (lambda (pair)
                           (let ((index (car pair))
                                 (digit (cdr pair)))
                             (= box (get-box index))))
                         (zip (range (length board))
                              board))))
    (map
     cadr
     matching-pairs)))


; find-empty-cell :: board -> cell
;               :: board -> int
(define (find-empty-cell board)
  (index-of board 0))


; get-non-candidates :: board -> cell -> [digits]
;                    :: [int] -> int -> [int]
(define (get-non-candidates board cell)
  (remove-duplicates
   (append (get-row-digits board (get-row cell))
           (get-col-digits board (get-col cell))
           (get-box-digits board (get-box cell)))))


; possible? :: board -> cell -> digit -> boolean
;           :: [int] -> int -> int -> boolean
(define (possible? board cell digit)
  (not (member digit (get-non-candidates board cell))))


(define (is-valid-sudoku board)
  (foldl
   (lambda (cell acc)
     (let ((digit (get-cell-digit board cell)))
       (and acc
            (if (zero? digit)
                #t
                (possible?
                 (set-cell-digit board cell 0)
                 cell
                 digit)))))
   #t
   (range (length board)))) 


(display-board
 (convert-board original-board))

(is-valid-sudoku (convert-board original-board))
