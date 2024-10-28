import re

def abbreviate(words):
    ws = [ word for word in re.split(" |_|-", words) if len(word) > 0 ]
    return "".join(map(lambda w: w[0], ws)).upper()
