from collections import Counter

def is_pangram(sentence):
    counts = Counter(sentence.lower())
    letters = list(char for char in counts.keys() if char.isalpha())
    return 26 == len(letters)
