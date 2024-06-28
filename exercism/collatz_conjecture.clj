(ns collatz-conjecture)

(defn collatz [num]
  (cond (= 1 num) 0
        (even? num) (inc (collatz (/ num 2)))
        (odd? num) (inc (collatz (+ 1 (* 3 num))))))
