(ns nth-prime)

(defn prime? [n]
  (cond 
    (<= n 1) false
    (= n 2) true
    (zero? (mod n 2)) false
    :else (loop [i 3]
            (cond
              (> (* i i) n) true
              (zero? (mod n i)) false
              :else (recur (+ i 2))))))

(defn nth-prime [number]
  (if (<= number 0)
    (throw (IllegalArgumentException. "there is no zeroth prime"))
    (loop [x 2, n 1]
      (if (and (prime? x) (= n number))
        x
        (recur (inc x) (if (prime? x) (inc n) n))))))
