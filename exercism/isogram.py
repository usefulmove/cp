from collections import Counter

def is_isogram(string):
    letters = [ c.lower() for c in string if c.isalpha() ]
    counts = Counter(letters)

    return all([ value == 1 for value in counts.values() ])
