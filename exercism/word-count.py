from collections import Counter
import re

def count_words(sentence):
    words = [
        word.strip("'")
        for word in re.split(r'[ .,!&@$%^:_\t\n]', sentence.lower())
        if word.strip("'")
    ]
    cnts = Counter(words)
    return cnts
