(defn score-letter [c]
  (case c
    (\d \g) 2
    (\b \c \m \p) 3
    (\f \h \v \w \y) 4
    (\k) 5
    (\j \x) 8
    (\q \z) 10
    1))

(defn score-word [word]
  (reduce 
    (fn [acc c]
      (+ acc (score-letter c)))
    0
    (seq (clojure.string/lower-case word))))
