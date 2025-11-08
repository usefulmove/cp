def score_of_string(s)
    def recur(cs, acc = 0)
        if cs.length < 2
            return acc
        end
        
        recur(cs[1..], acc + (cs[0].ord - cs[1].ord).abs)
    end

    recur(s.chars)
end
