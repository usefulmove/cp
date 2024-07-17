from functools import reduce

def is_valid(isbn):
    # contains illegal characters?
    if not all(map(lambda c: c in "-0123456789X", isbn)):
        return False

    chars = list(c for c in isbn if c != "-" if c in "0123456789X")

    # more or less than 10 legal characters?
    if len(chars) != 10:
        return False

    # X somewhere other than end?
    if "X" in chars and chars.index("X") != 9:
        return False

    nums = map(lambda c: 10 if c == "X" else int(c), chars)

    comp = reduce(
        lambda acc, pair: acc + (pair[0]+1)*pair[1],
        enumerate(nums),
        0
    )

    return 0 == comp % 11


print(is_valid("3-598-21508-8")) # True
print(is_valid("3-598-21508-X")) # False
