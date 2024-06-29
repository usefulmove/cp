def score(word):
    letter_scores = {
        "aeioulnrst": 1,
        "dg": 2,
        "bcmp": 3,
        "fhvwy": 4,
        "k": 5,
        "jx": 8,
        "qz": 10,
    }

    def letter_score(letter):
        for letters in letter_scores:
            if letter in letters:
                return letter_scores[letters]
        return 0
    
    return sum(letter_score(letter) for letter in word.lower())
