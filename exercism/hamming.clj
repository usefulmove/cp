(ns hamming)

(defn distance [strand1 strand2]
  (if (= (count strand1)
         (count strand2))
    (count (filter
            true?
            (map (fn [c1 c2] (not= c1 c2)) strand1 strand2)))
    nil))
