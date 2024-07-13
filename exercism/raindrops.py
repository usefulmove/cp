def convert(number):
    res = ""

    if 0 == number % 3:
        res += "Pling"

    if 0 == number % 5:
        res += "Plang"

    if 0 == number % 7:
        res += "Plong"

    if not res == "":
        return res

    return str(number)
