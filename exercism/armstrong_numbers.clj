(ns armstrong-numbers)

(defn armstrong? [num]
  (let [s-digits (str num)
        num-digits (count s-digits)]
    (== num (reduce
             (fn [acc s-digit]
               (+ acc (Math/pow (Character/digit s-digit 10) num-digits)))
             0
             s-digits))))
